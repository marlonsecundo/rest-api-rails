class Location < ApplicationRecord
    belongs_to :survivor, dependent: :destroy

    validates :x, :y, presence: true

end
