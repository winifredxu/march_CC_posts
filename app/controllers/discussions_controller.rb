class DiscussionsController < ApplicationController
  before_action :find_post

  # POST /posts/5/discussions
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

  # DELETE /posts/5/discussions/10
  def destroy
    @discussion = Discussion.find params[:id]
    @discussion.destroy
    redirect_to post_path(@post)
  end

  # GET /posts/5/discussions/10
  def show
    @discussion = Discussion.find params[:id]
    @comment    = Comment.new
  end

  private

  def discussion_params
    params.require(:discussion).permit(:title, :body)
  end

  def find_post
    @post = Post.find params[:post_id]
  end
end
