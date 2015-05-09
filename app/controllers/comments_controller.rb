class CommentsController < ApplicationController
	def create
		@entry = Entry.find(params[:comment][:entry_id])
		@comment = @entry.comments.build(comment_params)
		debugger
		if @comment.save
			flash[:success] = "Comment created!"
			redirect_to @entry
		else
			#@feed_items= []
			#render 'static_pages/home'
			flash[:error] = "False!"
			redirect_to @entry
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:name, :content)
	end
end
