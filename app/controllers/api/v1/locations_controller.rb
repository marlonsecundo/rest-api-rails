class Api::V1::LocationsController < ApplicationController

    # GET /api/v1/survivors/1/locations
    def index
        locations = Location.find(params[:survivor_id])
        render(json: locations)
    end

    # PACTH/PUT /api/v1/survivors/1/locations
    def update     

        location = Location.find(params[:survivor_id])

        location.update(location_params)
            
        render(json: location)
    end
        
    private
    def location_params
        params.include?(:location) ? params.require(:location).permit(:x,:y)
    end
end
