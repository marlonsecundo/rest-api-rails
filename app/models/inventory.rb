class Inventory < ApplicationRecord
    belongs_to :survivor, dependent: :destroy

    validates :water, :food, :medication, :ammunition, presence: true
end
