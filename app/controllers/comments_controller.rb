class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:comment][:post_id])
		num_comments = @post.comments.length
			@comment = @post.comments.create!(comment_params)

		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	private
      def comment_params
			params.require(:comment).permit( :body,:user_id, :post_id,:parent_id)
		end
end
