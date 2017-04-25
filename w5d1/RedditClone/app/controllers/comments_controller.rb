class CommentsController < ApplicationController

  def new
    @comment = Comment.new(post_id: params[:post_id])
    render :new
  end

  def show
    @comment = Comment.find(params[:id])
    @new_comment = @comment.child_comments.new
    render :show
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      redirect_to new_post_comment_url(@comment.post_id)
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id, :parent_comment_id)
  end
end
