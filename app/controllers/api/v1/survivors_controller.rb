class Api::V1::SurvivorsController < ApplicationController
    
    before_action :setParams!

    @survivor_params = nil
    
    # GET /api/v1/survivors
    def index
        survivors = Survivor.all
        render(json: survivors)
    end

    # GET /api/v1/survivors/1
    def show
        survivor = Survivor.find(params[:id])
        render(json: survivor)
    end

    # POST /api/v1/survivors
    def create

        survivor = Survivor.new(@survivor_params)

        if (survivor.save)
            render(json: survivor, status: :created)
        else
            render(json: survivor.errors, status: :unprocessable_entity)
        end

    end

    # PACTH/PUT /api/v1/survivors/1
    def update

        survivor = Survivor.find(params[:id])

        if (survivor.update(@survivor_params))
            render(json: survivor)
        else
            render(json: survivor.errors, status: :unprocessable_entity)
        end

    end
        
    private
    def setParams!
        @survivor_params = params.include?(:survivor) ? params.require(:survivor).permit(
            :id, :name, :age, :gender, :flags, 
            location_attributes:[:x, :y],
            inventory_attributes:[:water,:food,:medication,:ammunition]) : nil
    end
end
