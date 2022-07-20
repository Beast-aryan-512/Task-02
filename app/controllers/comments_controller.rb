class CommentsController < ApplicationController
	before_action :find_post
	

	def create
		@comment = @post.comments.create(comment_params)
		redirect_to post_path(@post)
	end

	def destroy
		if !(already_comment?)
			flash[:notice] = "Cannot comment"
		else
			@comment.destroy
		end
		redirect_to post_path(@post)
	end
	
	def show
		@comment = Comment.all
	end


	private
	def find_post
		@post = Post.find(params[:post_id])
	end
	# def already_liked?
	# 	Comment.where(user_id: current_user.id, post_id:
	# 		params[:post_id]).exists?
	# end

	# def find_like
	# 	@comment = @post.comments.find(params[:id])
	# end

	def comment_params
		params.require(:comment).permit(:id, :post_id, :body)
	end
end
