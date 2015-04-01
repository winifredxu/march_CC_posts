class CommentsController < ApplicationController

  def create
    @discussion = Discussion.find params[:discussion_id]
    @comment = Comment.new comment_params
    @comment.discussion = @discussion
    if @comment.save
      redirect_to post_discussion_path(@discussion.post, @discussion)
    else
      render "discussions/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
