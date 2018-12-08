require 'pry'
class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]

  def favorites
    respond_to do |format|
  end

  def show
    @dish = Dish.find(params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @dish}
    end

    #render json: @dish.to_json
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    #@dish.reject {|item| !item.present?}
    @dish.chef_id = session[:chef_id]
    if @dish.save
      redirect_to chef_path(session[:chef_id])
    else
      render :new
    end
  end

  def edit
    #@dish = Dish.find_by(params[:id])
  end

  def update
    if @dish.update(dish_params)
      redirect_to @dish
    else
      render :edit
    end
  end

  def destroy
    @chef = @dish.chef
    @dish.dish_ingredients.destroy_all
    @dish.destroy
    redirect_to chef_path(@chef)
  end

  private
  def set_dish
    @dish = Dish.find(params[:id])
  end

    def dish_params
      params.require(:dish).permit(
        :name,
        :cook_time,
        dish_ingredients_attributes: [:quantity,
        ingredients: [:name]]
      )
    end
end
