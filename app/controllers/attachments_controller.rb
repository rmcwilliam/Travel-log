class AttachmentsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @attachments = Attachment.where(log_id: params[:id])
    render "index.json.jbuilder", status: :ok
  end

  def create
    @attachment = Attachment.new(location: params[:location],
                                               attachment: params[:attachment],
                                               timestamp: params[:timestamp],
                                               caption: params[:caption],
                                               log_id: params[:log_id],
                                               user_id: current_user.id)
    
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


  def destroy
    attachment = Attachment.find(params[:id])
    log = Log.find(attachment.log_id)

    if current_user.id == attachment.user_id
      attachment.destroy
      render json: {success: "Attachment delete successful!"}, status: :accepted
    else
      render json: { error: "Unable to delete the attachment." },    
            status: :unauthorized 
    end
  end

end
