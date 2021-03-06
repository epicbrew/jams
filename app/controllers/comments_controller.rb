class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_commentable

  def create
    @author = current_user
    comment = @commentable.comments.new comment_params
    comment.author = @author

    respond_to do |format|
      if comment.save
        format.html { redirect_to :back }
      end
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    authorize! :destroy, @comment
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end

private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def comment_params
    params.require(:comment).permit(:author_id, :body, :commentable_id, :commentable_type)
  end
end
