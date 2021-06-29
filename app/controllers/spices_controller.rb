class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        render json: Spice.all
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice
    end

    def show
        spice = Spice.find(params[:id])
        render json: spice
    end

    def update
        spice = Spice.find(params[:id])
        spice.update(spice_params)
        render json: spice
    end


    def destroy
        spice = Spice.find(params[:id])
        spice.destroy
        # head :no_content
        render json: {}
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def render_not_found_response
        render json: {error: "The spice doesn't exist"}
    end

end
