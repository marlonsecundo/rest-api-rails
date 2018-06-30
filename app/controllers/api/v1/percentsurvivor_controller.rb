class Api::V1::PercentsurvivorController < ApplicationController

    # GET /api/v1/percentsurvivor
    def index

        total = Survivor.all.size
        normal = 0

        Survivor.all.each do |survivor|
            if (survivor.flags < 3)
                normal += 1
            end
        end

        percent = normal / total * 100

        render(json: {percent: percent} )

    end
end
