# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    def create
      @comment = resource_post.comments.build(comment_params)

      if @comment.save
        redirect_to @resource_post, notice: 'Comment was successfully created.'
      else
        render :new, notice: 'Comment creation failed.'
      end
    end

    def edit
      @url = comment_path
      @comment = PostComment.find params[:id]
    end

    def update
      @comment = PostComment.find params[:id]

      if @comment.update(comment_params)
        redirect_to @comment.post, notice: 'Comment was successfully updated.'
      else
        render :new, notice: 'Comment edition failed.'
      end
    end

    def destroy
      @comment = PostComment.find params[:id]
      @comment.destroy
      redirect_to @comment.post, notice: 'Comment was successfully destroyed.' # !!!!!
    end

    private

    def comment_params
      params.require(:post_comment).permit(:body, :author, :post_id)
    end
  end
end
