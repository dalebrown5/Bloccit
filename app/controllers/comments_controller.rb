class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to [@topic, @post], notice: "Comment was saved."
    else
      redirect_to [@topic, @post], notice: "Error, comment was not saved."
      render :new
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
