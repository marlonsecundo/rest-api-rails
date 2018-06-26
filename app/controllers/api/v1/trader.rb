class Api::V1::Trader


    def initialize()
        @WATER_POINT = 4
        @FOOD_POINT = 3
        @MEDICATION_POINT = 2
        @AMMUNITION_POINT = 1    
    end

    attr_reader :WATER_POINT
    attr_reader :FOOD_POINT
    attr_reader :MEDICATION_POINT
    attr_reader :AMMUNITION_POINT


end