class Api::V1::CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :update, :destroy]
    before_action :set_user
  
    def index
      @comments = @user.comments
      render json: @comments
    end
  
    def show
      render json: @comment
    end
  
    def create
      @comment = @user.comments.new(comment_params)
  
      if @comment.save
        render json: @comment, status: :created
      else
        render json: {error: 'Unable To Save Comment'}
      end
    end
  
    def update
      if @comment.update(comment_params)
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @comment.destroy
    end
  
    private
      def set_user
        @user = User.find(params[:user_id])
      end

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:content, :user_id, :topic_id)
      end
end