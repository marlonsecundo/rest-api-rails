class Api::V1::SurvivorsController < ApplicationController
    
    before_action :setParams!

    @survivor_params = nil
    
    # GET /api/v1/survivors
    def index
        survivors = Survivor.all

        if (survivors.size > 0)
            render(json: survivors)
        else
            render(json: { Message: "No survivors registered in the apocalypse" } )
        end
    end

    # GET /api/v1/survivors/1
    def show
        
        survivor = Survivor.find(params[:id])
        renderSurvivor(survivor)
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

    def renderSurvivor(survivor)

        location = Location.find_by(survivor_id: survivor.id)
        inventory = Inventory.find_by(survivor_id: survivor.id)
        render(json: {Survivor: survivor, Location: location, Inventory: inventory})

    end
        
    private
    def setParams!
        @survivor_params = params.include?(:survivor) ? params.require(:survivor).permit(
            :id, :name, :age, :gender, :flags, 
            location_attributes:[:x, :y],
            inventory_attributes:[:water,:food,:medication,:ammunition]) : nil
    end
end
