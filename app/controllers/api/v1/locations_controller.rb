class Api::V1::LocationsController < ApplicationController

    before_action :setParams!

    @@location_params = nil

    # GET /api/v1/survivors/1/locations
    def index
        @locations = Location.find(@@location_params[:survivor_id])
        render(json: @locations)
    end

    # PACTH/PUT /api/v1/survivors/1/locations/1
    def update     

        @location = Location.find(params[:survivor_id])

        if (@location.update(@@location_params))
            render(json: @location)
        else
            render(json: @location.errors, status: :unprocessable_entity)
        end
    end
        
    private
    def setParams!
        @@location_params = params.include?(:location) ? params.require(:location).permit(:x,:y) : params
    end
end
