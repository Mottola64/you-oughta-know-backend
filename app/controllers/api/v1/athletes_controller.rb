class Api::V1::AthletesController < ApplicationController

    def index
        @athletes = Athlete.all
        render json: @athletes
    end

    def create
        user = User.first
        @athlete = user.athletes.new(athlete_params)
        if @athlete.save
            render json: @athlete
        else
            render json: {error: 'Error Creating Athlete'}
        end
    end

    def show
        @athlete = Athlete.find(params[:id])
        render json: @athlete
    end

    def update
        if @athlete.update(athlete_params)
            render json: @athlete
        else
            render json: {error: 'Error Updating Athlete'}
        end
    end

    def destroy
        @athlete = Athlete.find(params[:id])
        @athlete.destroy
    end

    private

    def athlete_params
        params.require(:topic).permit(:name, :description, :birthdate)
    end


end
