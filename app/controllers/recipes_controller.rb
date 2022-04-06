class RecipesController < ApplicationController
    before_action :authorize 

    def index 
        render json: Recipe.all, status: :created
    end

    def create 
        recipes = Recipe.create(recipe_params)
        render json: recipes, status: :created
    end

    private 
    
    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end
    def authorize 
        return render json: {error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    end
end
