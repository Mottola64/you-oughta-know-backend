class Api::V1::CommentsController < ApplicationController
    before_action :set_topic
  
    def index
      @comments = @topic.comments
      render json: @comments
    end
  
    def show
      @comment = Comment.find(params[:id])
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
      @comment = Comment.find(params[:id])
      @comment.destroy
    end
  
    private
      def set_topic
        @topic = Topic.find(params[:topic_id])
      end

      def comment_params
        params.require(:comment).permit(:content, :user_id, :topic_id)
      end
end