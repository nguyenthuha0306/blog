class CommentsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  
  def create
    @entry = Entry.find params[:comment][:entry_id]
    @comment = current_user.comments.build comment_params
    @comment.entry = @entry
        
    if @comment.save
      flash[:success] = "Comment created sccessfully!"
      redirect_to @entry
    else
      flash[:danger] = "False!"
      redirect_to @entry
    end
  end

  private
  def comment_params
    params.require:comment.permit :name, :content
  end
end
