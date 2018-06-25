class Api::V1::PointslostController < ApplicationController

    # GET /api/v1/pointslost
    def index

        countLost = 0
        
        Survivor.all.each do |survivor|

            if (survivor.flags >= 3)
            
                countLost += (survivor.inventory.water * WATER_POINT)
                countLost += (survivor.inventory.food * FOOD_POINT)
                countLost += (survivor.inventory.medication * MEDICATION_POINT)
                countLost += (survivor.inventory.ammunition * AMMUNITION_POINT)

            end
            
        end

        render(json: countLost)
    end
end
