class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    def index
        @users = User.all
    
        render json: @users
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            render json: user, status: created
        else
            render json: user.errors, status: :unprocessable_entity
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end
end
end
