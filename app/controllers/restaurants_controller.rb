class RestaurantsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    wrap_parameters format: []

    def index
        render json: Restaurant.all
    end

    def show
        restaurant = find_restaurant
        render json: restaurant, serializer: ShowRestaurantSerializer
    end

    def create
        new_restaurant = Restaurant.create!(restaurant_params)
        render json: new_restaurant, status: :created
    end

    def update
        restaurant = find_restaurant
        restaurant.update!(restaurant_params)
        render json: restaurant, status: :ok
    end

    def destroy
        restaurant = find_restaurant
        restaurant.destroy
        render json: { message: "Pizza Restaurant Deleted" }, status: :no_content
    end


    private

    def restaurant_params
        params.permit(:address)
    end

    def find_restaurant
        Restaurant.find(params[:id])
    end

    def render_not_found_response
        render json: { errors: "Restaurant not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
