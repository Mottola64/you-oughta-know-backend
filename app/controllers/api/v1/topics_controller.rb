class Api::V1::TopicsController < ApplicationController

    def index
        @topics = Topic.all

        render json: @topics
    end

    def show
        render json: @topic
    end

    def create
        @topic = Topic.new(topic_params)

        if @topic.save
            render json: @topic, status: :created
        else
            render json: @topic.errors, status: 404
        end
    end

    def update
        if @topic.update(topic_params)
            render json: @topic
        else
            render json: @topic.errors, status: 404
        end
    end

    def destroy
        @topic.destroy
    end

    private
        def topic_params
            params.require(:topic).permit(:name, :description, :category)
        end
    end
