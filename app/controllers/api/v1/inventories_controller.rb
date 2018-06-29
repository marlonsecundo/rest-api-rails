class Api::V1::InventoriesController < ApplicationController

    # GET /api/v1/survivors/1/inventories
    def index
        inventories = Inventory.find(params[:survivor_id])
        render(json: inventories)
    end

    # POST /api/v1/survivors/1/inventories
    def create

        inventory = Inventory.new(inventory_params)

        begin
            inventory.save!
            render(json: inventory, status: :created)
        rescue Exception => e
            render(json: {Error: 201, json: e})
        end
    end
        
    private

    def inventory_params
        params.include?(:inventory) ? params.require(:inventory).permit(:water, :food, :medication, :ammunition) : nil
    end
end
