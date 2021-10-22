class ActivitiesController < ApplicationController

    def index
        @activities = Activity.all
        if @activities
            render json: @activities.as_json(except: :signups), status: 200
        else 
            render json: {errors: "No activities found"}, status: 404
        end
    end

    def show
        @activity = Activity.find_by(id: params[:id])
        if @activity
            render json: @activity, status: 200
        else 
            render json: {errors: "activity not found"}, status: 404
        end
    end
    
    def destroy
        @activity = Activity.find_by(id: params[:id])
        @activity.destroy
    end

end
