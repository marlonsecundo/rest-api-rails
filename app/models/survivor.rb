class Survivor < ApplicationRecord
    has_one :location, inverse_of: :survivor, dependent: :destroy
    has_one :inventory, inverse_of: :survivor, dependent: :destroy

    validates :name, :age, :gender, :flags, :location, :inventory, presence: true

    accepts_nested_attributes_for :location
    accepts_nested_attributes_for :inventory
end
