class Api::V1::TradeitemController < ApplicationController
    before_action :setParams!

    @trade_params = nil

    # POST /api/v1/tradeitem
    def create

        survivor = Survivor.find(@trade_params[:id])
        inventory = Inventory.new(@trade_params[:items])

        anotherSurvivor = Survivor.find(@trade_params[:anotherId])
        anotherInventory = Inventory.new(@trade_params[:anotherItems])

        if (survivor.flags < 3 && anotherSurvivor.flags < 3)
            
            if (inventory.points == anotherInventory.points)

                if (survivor.inventory.has_inventory?(inventory) && anotherSurvivor.inventory.has_inventory?(anotherInventory))

                    # render(json: "{ \"YEAHHHH\":\"UHUUUUUU\" }")

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

                end

            end
        end


        
        
    end

    def setParams!

        @trade_params = params.include?(:trade) ? params.require(:trade).permit(
            :id, :anotherId, 
            items:[:water,:food, :medication, :ammunition], 
            anotherItems:[:water,:food,:medication,:ammunition] 
        ) : nil

    end

end
