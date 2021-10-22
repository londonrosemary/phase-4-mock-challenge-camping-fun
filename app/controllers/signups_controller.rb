class SignupsController < ApplicationController
    def index
        @signups = Signup.all 
        if @signups
            render json: @signups, status: 200
        else  
            render json: {errors: "signups not found"}, status: 404
        end
    end

    def show
        @signup = Signup.find_by(id: params[:id])
        if @signup
            render json: @signup, status: 200
        else 
            render json: {errors: "signup not found"}, status: 404
        end
    end

    def create
        @new_signup = Signup.create(signup_params)
        if @new_signup.valid?
            render json: @new_signup.as_json(include: :activity), status: 200
        else
            render json: {errors: "validation errors"}, status: 422
        end
    end

    private 
    
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
