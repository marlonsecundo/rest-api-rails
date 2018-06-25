class Api::V1::AverageamountController < ApplicationController
  
    # GET /api/v1/averageamout
    def index
        survivors = Survivor.all

        water = 0
        food = 0
        medic = 0
        amm = 0
        count = 0

        Survivor.all.each do |surv|

            if (surv.flags < 3)
                water += surv.inventory.water
                food += surv.inventory.food
                medic += surv.inventory.medication
                amm += surv.inventory.ammunition
                count += 1
            end

        end
    
        average = Hash.new 
        average[:water] = water / count
        average[:food] = food / count
        average[:medication] = medic / count
        average[:ammunition] = amm / count

        render(json: average)
    end
end
