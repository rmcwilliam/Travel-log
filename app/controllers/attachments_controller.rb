class AttachmentsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @attachments = Attachment.where(log_id: params[:id])
    render "index.json.jbuilder", status: :ok
  end

  def create
    @attachment = current_user.attachments.new(attachment_params)
    if @attachment.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @attachment.errors.full_messages },
          status: :unprocessable_entity
    end
  end

  def show
    @attachment = Attachment.find(params[:id])
    render "show.json.jbuilder", status: :ok
  end

  # def update
  # end

  def destroy
    attachment = Attachment.find(params[:id])
    log = Log.find(attachment.log_id)

    if current_user.id == post.user_id
      flash[:notice] = "Destroyed the attachment: #{attachment.title}"
      attachment.destroy
    else
      flash[:notice] = "I can't let you do that."
    end
  end

  private
  def attachment_params
    params.require(:attachments.permit(:user_id, :log_id)
  end
end
