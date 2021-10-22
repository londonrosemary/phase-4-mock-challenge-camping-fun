class CampersController < ApplicationController
    def index
        @campers = Camper.all 
        if @campers
            render json: @campers.as_json(except: :activity), status: 200
        else 
            render json: {errors: "campers not found"}, status: 404 
        end
    end

    def show
        @camper = Camper.find_by(id: params[:id])
        if @camper
            render json: @camper, status: 200
        else 
            render json: {errors: "camper not found"}, status: 404
        end
    end

    def create
        @new_camper = Camper.create(camper_params)
        if @new_camper.valid?
            render json: @new_camper, status: 200
        else 
            render json: {errors: "validation errors"}, status: 422
        end
    end

    private 

    def camper_params
        params.permit(:name, :age)
    end
end
