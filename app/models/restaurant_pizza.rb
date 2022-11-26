class RestaurantPizza < ApplicationRecord

    belongs_to :pizza
    belongs_to :restaurant

    validates :price, presence: true, inclusion: { in: (1..30) }
    validates :pizza_id, presence: true
    validates :restaurant_id, presence: true

end
