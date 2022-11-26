class RestaurantsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    wrap_parameters format: []

    def index
        render json: Restaurant.all
    end

    def show
        restaurant = find_restaurant
        render json: restaurant, serializer: ShowRestaurantSerializer
    end


    private

    def restaurant_params
        params.permit(:name, :address)
    end

    def find_restaurant
        Restaurant.find(params[:id])
    end

    def render_not_found_response
        render json: { errors: "Restaurant not found"}, status: :not_found
    end

end
