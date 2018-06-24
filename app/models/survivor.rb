class Survivor < ApplicationRecord
    has_many :inventory
    has_many :location

    accepts_nested_attributes_for :inventory
    accepts_nested_attributes_for :location
end
