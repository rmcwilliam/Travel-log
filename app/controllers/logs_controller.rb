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
     @logs = Log.where(user_id: params[:id])
    render "index.json.jbuilder", status: :accepted 
  end

  def show
    @log = Log.find_by(params[:log_id])
    render "show.json.jbuilder", status: :accepted
  end

  def update
     @log = Log.find_by(params[:log_id])
     if @log && current_user.id == @log.user_id
      @log.update(title: params[:title], description: params[:description])
      render json: {success: "Title: #{@log.title}, Description: #{@log.description}"}, status: :accepted 
    else    
     render json: { error: "Unable to edit the log" },    
            status: :unauthorized   
    end
  end

  def destroy
    @log = Log.find_by(params[:log_id])
     if @log && current_user.id == @log.user_id
      @log.destroy
      render json: {success: "Log delete successful!"}, status: :accepted 
    else    
     render json: { error: "Unable to delete the log." },    
            status: :unauthorized   
    end
  end
end
