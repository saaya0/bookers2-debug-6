class BookCommentsController < ApplicationController

	def create
		@book = Book.find(params[:book_id])
		@comment = current_user.book_comments.new(book_comment_params)
		@comment.book_id = @book.id
		@comment.save
	end

	def destroy
		@book = Book.find(params[:book_id])
		@book_comment = BookComment.find(params[:id])
		if @book_comment.user != current_user
    		redirect_to request.referer
		else
    	@book_comment.destroy
    end

	end

	private

	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end

end