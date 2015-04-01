class DiscussionsController < ApplicationController
  before_action :find_post

  def create
    @discussion      = Discussion.new discussion_params
    # @discussion.post_id = @post.id
    @discussion.post = @post
    if @discussion.save
      redirect_to post_path(@post)
    else
      render "posts/show"
    end
  end

  def destroy
    @discussion = Discussion.find params[:id]
    @discussion.destroy
    redirect_to post_path(@post)
  end

  private

  def discussion_params
    params.require(:discussion).permit(:title, :body)
  end

  def find_post
    @post = Post.find params[:post_id]
  end
end
