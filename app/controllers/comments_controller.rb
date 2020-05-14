class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @topic = Topic.find(params[:topic_id])
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
    
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      redirect_to topics_path, danger: 'コメントを投稿できませんでした'
    end
    
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  
end
