class CategoriesController < ApplicationController
    def index
        categories = Category.all
        render json: {success: true, categories: categories}, status: :ok
    end

    def show
        category = Category.find(params[:id])
        render json: {success: true, categories: category}, status: :ok
    end

    def create
        category = Category.new(category_params)
        if category.save
            render json: {success: true, categories: category}, status: :created
        else 
            render json: {success: false, message: category.errors.full_messages}, status: :bad_request
        end
        
    end

    private

    def category_params
        params.require(:category).permit :name
    end
end
