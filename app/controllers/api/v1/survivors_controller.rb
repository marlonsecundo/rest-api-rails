class Api::V1::SurvivorsController < ApplicationController

    # GET /api/v1/survivors
    def index
        @survivors = Survivor.all()
        render(json: @survivors)
    end

    # GET /api/v1/survivors/1
    def show
        render(json: @survivor)
    end

    # POST /api/v1/survivors
    def create
        @survivor = Survivor.new(survivor_params)

        if (@survivor.save())
            render(json: @survivor, status: :created, location: @survivor)
        else
            render(json: @survivor.errors, status: :unprocessable_entity)
        end
    end

    # PACTH/PUT /api/v1/survivors/1
    def update

        if (@survivor.update(survivor_params))
            render(json: @survivor)
        else
            render(json: @survivor.errors, status: :unprocessable_entity)
        end

    end

    # DELETE /api/v1/survivors/1
    def delete

        @survivor.destroy()
        
    end
    
end