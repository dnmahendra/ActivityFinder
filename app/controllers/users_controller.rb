class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  end

  def create
    debugger
    if params[:user][:avatar].nil?
      params[:user][:avatar] = "http://placehold.it/100x100"
    end
    @user = User.new(user_params)
    @user.save
    redirect_to '/'
  end

  def show
      @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.save
    redirect_to '/'
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/'
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar, :location, :age, :gender)
  end
end