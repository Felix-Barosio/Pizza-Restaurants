class Restaurant < ApplicationRecord

    has_many :restaurant_pizzas, dependent: :destroy
    has_many :pizzas, through: :restaurant_pizzas

    validates :address, presence: true
    validates :name, presence: true

end
