class PlantsController < ApplicationController

  def index
    plants = Plant.all
    render json: plants
  end

  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def update
    plant = Plant.find_by(id: params[:id])
    plant.update(plant_params)
    render json: plant
  end

  def destroy
    plant = Plant.find(params[:id])
    plant.destroy
    render json: {}
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
end