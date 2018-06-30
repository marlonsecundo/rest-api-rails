class Api::V1::SurvivorsController < ApplicationController
        
    # GET /api/v1/survivors
    def index
        list = []

        Survivor.all.each do |survivor|

            list << { survivor: survivor, location: survivor.location, inventory: survivor.inventory }
        end


        if (Survivor.all.size > 0)
            render(json: {tags: list})
        else
            render(json: {Error: 404, Message: "No survivors registered in the apocalypse" } )
        end
    end

    # GET /api/v1/survivors/1
    def show
        
        begin
            survivor = Survivor.find(params[:id])
            renderSurvivor(survivor)
        rescue Exception => e
            render(json: {Error: 404, Message: e})
        end

    end

    # POST /api/v1/survivors
    def create
        begin

        survivor = Survivor.new(survivor_params)

            survivor.save!
            render(json: {Ok: 201, Message: "Item created", survivor: survivor})
        rescue Exception => e
            render(json: {Error: 400, json: e})
        end

    end

    # PACTH/PUT /api/v1/survivors/1
    def update

        begin
            survivor = Survivor.find(params[:id])
            survivor.update!(survivor_params)
            renderSurvivor(survivor)
        rescue ActiveRecord::RecordNotFound => e
            render(json: {Error: 404, Message: e})
        rescue ActionController::ParameterMissing => e
            render(json: {Error: 400, Message: e})
        end

    end


        
    private
    def renderSurvivor(survivor)

        location = Location.find_by(survivor_id: survivor.id)
        inventory = Inventory.find_by(survivor_id: survivor.id)
        render(json: {Survivor: survivor, Location: location, Inventory: inventory})

    end

    def survivor_params

        params.include?(:survivor) ? params.require(:survivor).permit(
            :id, :name, :age, :gender, :flags, 
            location_attributes:[:x, :y],
            inventory_attributes:[:water,:food,:medication,:ammunition]) : nil
    end
end