class DiscussionsController < ApplicationController

  def create
    @post            = Post.find params[:post_id]
    @discussion      = Discussion.new discussion_params
    # @discussion.post_id = @post.id
    @discussion.post = @post
    @discussion.save
    redirect_to post_path(@post)
  end

  private

  def discussion_params
    params.require(:discussion).permit(:title, :body)
  end
end
