# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = Comment.new(
      content: params.require(:comment).permit(:content)[:content], product_id: params[:product_id]
    )
    flash[:notice] = if @comment.save
                       'Komentarz został dodany'
                     else
                       @comment.errors.full_messages.join('. ')
                     end

    redirect_to @comment.product
  end

  def show
    @comment = Comment.find(params[:id])
  end
end
