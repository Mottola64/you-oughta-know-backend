class Api::V1::TopicsController < ApplicationController

    def index
        @topics = Topic.all
        render json: @topics
    end

    def show
        @topic = Topic.find(params[:id])
        render json: @topic
    end

    def create
        @topic = Topic.new(topic_params)

        if @topic.save
            render json: @topic
        else
            render json: {error: 'Error Creating Topic'}
        end
    end

    def update
        if @topic.update(topic_params)
            render json: @topic
        else
            render json: {error: 'Error Updating Topic'}
        end
    end

    def destroy
        @topic = Topic.find(params[:id])
        @topic.destroy
    end

    private
        def topic_params
            params.require(:topic).permit(:name, :description, :category)
        end
end
