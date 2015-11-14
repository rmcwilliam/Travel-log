class RegistrationsController < ApplicationController
  def create
  	@user = User.new(
      email: params[:email],
      username: params[:username],
      password: params[:password])
    if @user.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def login
  	@user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      render "login.json.jbuilder", status: :ok
    else
      render json: { error: "Could not find user for #{params[:username]} or wrong password." },
        status: :unauthorized
    end
  end

  def destroy
  	@user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      @user.destroy
    else
      render json: { error: "Invalid username (#{params[:username]}) or password." },
        status: :unauthorized
    end
  end
end
