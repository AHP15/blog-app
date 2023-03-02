class PostsController < ApplicationController
  layout 'application'
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: @user.id)

    @posts = @posts.map do |post|
      comments = post.last_post_comments(post.id)
      { 'post' => post, 'comments' => comments }
    end

    render 'index'
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.last_post_comments(@post.id)
    @user = User.find(@post.user_id)

    render 'show'
  end
end
