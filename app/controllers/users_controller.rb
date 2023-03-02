class UsersController < ApplicationController
  layout 'application'
  def index
    @users = User.all
    render 'index'
  end

  def show
    @user = User.find(params[:id])
    @last_posts = @user.last_user_posts(@user.id)
    render 'show'
  end
end
