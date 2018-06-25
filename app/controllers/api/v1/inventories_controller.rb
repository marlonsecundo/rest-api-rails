class Api::V1::InventoriesController < ApplicationController
    before_action :setParams!

    @@inventory_params = nil

    # GET /api/v1/survivors/1/inventories
    def index
        @inventories = Inventory.all()
        render(json: @inventories)
    end

    # POST /api/v1/survivors/1/inventories
    def create

        @inventory = Inventory.new(@@inventory_params)

        if (@inventory.save)
            render(json: @inventory, status: :created)
        else
            render(json: @inventory.errors, status: :unprocessable_entity)
        end
    end
        
    private

    def setParams!
        @@inventory_params = params.include?(:inventory) ? params.require(:inventory).permit(:water, :food, :medication, :ammunition) : params
    end
end
