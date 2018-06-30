class Api::V1::TradeitemController < ApplicationController
    before_action :setParams!

    @trade_params = nil

    # POST /api/v1/tradeitem
    def create

        if setParams!.class == NilClass
            return
        end


        begin
            survivor = Survivor.find(@trade_params[:id])
            anotherSurvivor = Survivor.find(@trade_params[:anotherId])
            inventory = Inventory.new(@trade_params[:items])
            anotherInventory = Inventory.new(@trade_params[:anotherItems])
        rescue ActiveRecord::RecordNotFound => e

            render(json: {Error: 404, Message: e})
            return
        end


        if (survivor.flags < 3 && anotherSurvivor.flags < 3)
            
            if (inventory.points == anotherInventory.points)

                if (survivor.inventory.has_inventory?(inventory) && anotherSurvivor.inventory.has_inventory?(anotherInventory))

                    survivor.inventory.water += - inventory.water + anotherInventory.water
                    survivor.inventory.food +=  - inventory.food + anotherInventory.food
                    survivor.inventory.medication += - inventory.medication + anotherInventory.medication
                    survivor.inventory.ammunition += - inventory.ammunition + anotherInventory.ammunition

                    anotherSurvivor.inventory.water += inventory.water - anotherInventory.water
                    anotherSurvivor.inventory.food += inventory.food - anotherInventory.food
                    anotherSurvivor.inventory.medication += inventory.medication - anotherInventory.medication
                    anotherSurvivor.inventory.ammunition += inventory.ammunition - anotherInventory.ammunition

                    survivor.save
                    anotherSurvivor.save

                else




                    render(json: {Erro:"1001", Message:"Enough items: Some of the survivors do not have the items to be changed"})

                end

            else

                render(json: {Erro: "1002",Message:"Points no match: Not enough points for the exchange"})
            end

        else

            render(json: {Erro:"1003", Message:"Infected Survivor, Lockout: These items maybe infected!"})
        end


        
        
    end

    def setParams!

        
        @trade_params = params.include?(:trade) ? params.require(:trade).permit(
            :id, :anotherId, 
            items:[:water,:food, :medication, :ammunition], 
            anotherItems:[:water,:food,:medication,:ammunition]
        ) : nil

        begin

            [:items, :anotherItems].each do |req|
                @trade_params.require(req).require(:water)
                @trade_params.require(req).require(:food)
                @trade_params.require(req).require(:medication)
                @trade_params.require(req).require(:ammunition)
            end

            @trade_params.require(:id)
            @trade_params.require(:anotherId)

        rescue ActionController::ParameterMissing => e
            render(json: {Error: 400, Message: e})
            nil
        end

    end

end
