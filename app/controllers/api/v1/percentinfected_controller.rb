class Api::V1::PercentinfectedController < ApplicationController

    # GET /api/v1/percentinfected
    def index

        total = Survivor.all.size
        infected = 0

        Survivor.all.each do |survivor|
            if (survivor.flags > 3)
                infected += 1
            end
        end

        percent = infected / total * 100

        render(json: percent)

    end



end
