class Api::V1::FlagsController < ApplicationController

    # POST /api/v1/flags

    def create 

        survivor = Survivor.find(flags_params[:survivor_id])

        survivor.flags += 1

        survivor.save

    end

    def flags_params
        params.include?(:flag) ? params.require(:flag).permit(:survivor_id) : nil
    end

end
