class Api::V1::PointslostController < ApplicationController

    # GET /api/v1/pointslost
    def index

        countLost = 0

        trader = Api::V1::Trader.new         

        Survivor.all.each do |survivor|

            if (survivor.flags >= 3)
            

                countLost += (survivor.inventory.water * trader.WATER_POINT)
                countLost += (survivor.inventory.food * trader.FOOD_POINT)
                countLost += (survivor.inventory.medication * trader.MEDICATION_POINT)
                countLost += (survivor.inventory.ammunition * trader.AMMUNITION_POINT)
                
            end
            
        end

        render(json: { amount: countLost } )
    end
end
