class LogsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :update]

   def create
    @log = Log.new(title: params[:title],
                    description: params[:description],
                     user_id: current_user.id)
    if @log.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @log.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def index
     @logs = Log.find_by(user_id: params[:user_id])
     @logs.all
    render "show.json.jbuilder", status: :accepted 
  end

  def show
    @log = Log.find(params[:log_id])
    render "show.json.jbuilder", status: :accepted
  end

  def update
     @log = Log.find(params[:log_id])
     if @log && current_user.id == @log.user_id
      @log.update
      render json: {success: "Title: #{@log.title}"}, status: :accepted 
    else    
     render json: { error: "Unable to edit the log" },    
            status: :unauthorized   
    end
  end

  def destroy
    @log = Log.find(params[:log_id])
     if @log && current_user.id == @log.user_id
      @log.destroy
      render json: {success: "Log delete successful!"}, status: :accepted 
    else    
     render json: { error: "Unable to delete the deck." },    
            status: :unauthorized   
    end
  end
end

