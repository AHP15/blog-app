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
    @comments = Comment.where(post_id: @post.id)

    @comments = @comments.map do |comment|
      comment_user = User.find(comment.user_id)
      { 'name' => comment_user.name, 'text' => comment.text }
    end

    @user = User.find(@post.user_id)

    render 'show'
  end
end
