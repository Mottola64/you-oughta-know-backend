class Api::V1::CommentsController < ApplicationController
    def index
      @comments = Comment.all
      render json: @comments
    end
  
    def show
      @topic = Topic.find(params[:topic_id])
      comment = Comment.find(params[:id])
      render json: @comment
    end
  
    def create
      user = User.first

      @topic = Topic.find(params[:topic_id])
      comment = @topic.comments.new(comment_params)
      comment.user_id = user.id
      
      if comment.save
        render json: @topic, status: :created
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
      @topic = Topic.find(params[:topic_id])
      comment = Comment.find(params[:id])
      @comment.destroy
    end
  
    private


      def comment_params
        params.require(:comment).permit(:content, :topic_id, :user_id)
      end
end