class PizzasController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: Pizza.all
    end

    def show
        pizza = find_pizza
        render json: pizza, status: :ok
    end

    def create
        pizza = Pizza.create!(pizza_params)
        render json: pizza, status: :created
    end

    def update
        pizza = find_pizza
        pizza.update!(pizza_params)
        render json: pizza, status: :ok
    end

    def destroy
        pizza = find_pizza
        pizza.destroy
        render json: { message: "Pizza Deleted" }, status: :no_content
    end

    private

    def find_pizza
        Pizza.find(params[:id])
    end

    def pizza_params
        params.permit(:name, :ingredients)
    end

    def render_not_found_response
        render json: { errors: "Pizza not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
