class LikesController < ApplicationController
  def create
    puts params
    user_id = params[:user_id]
    post_id = params[:id]

    like = Like.new(user: current_user, post: Post.find(post_id))
    like.increace_likes_count(post_id)

    if like.save
      flash[:success] = 'Like saved successfully'
    else
      flash.now[:error] = 'Error: Like could not be saved'
    end

    redirect_to "/users/#{user_id}/posts/#{post_id}"
  end
end
