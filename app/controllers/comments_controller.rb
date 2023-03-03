class CommentsController < ApplicationController
  def new
    @user_id = current_user.id
    @post_id = params[:id]

    render 'new'
  end

  def create
    text = params[:comment]['text']
    post_id = params[:id]
    user_id = params[:user_id]
    comment = Comment.new(user: current_user, post: Post.find(post_id), text:)
    comment.increace_comments_count(post_id)

    if comment.save
      flash[:success] = 'Comment saved successfully'
    else
      flash.now[:error] = 'Error: Comment could not be saved'
    end

    redirect_to "/users/#{user_id}/posts/#{post_id}"
  end
end
