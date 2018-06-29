class Inventory < ApplicationRecord
    belongs_to :survivor, dependent: :destroy

    validates :water, :food, :medication, :ammunition, presence: true
    
    def points
        trader = Api::V1::Trader.new         
        result = water * trader.WATER_POINT + food * trader.FOOD_POINT + medication * trader.MEDICATION_POINT + ammunition * trader.AMMUNITION_POINT
    end

    def has_inventory? (inventory)
        has = false
        if (water >= inventory.water && food >= inventory.food && medication >= inventory.medication && ammunition >= inventory.ammunition)
            has = true
        end
        has
    end

end
