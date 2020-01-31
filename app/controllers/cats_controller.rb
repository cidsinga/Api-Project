class CatsController < ApplicationController

  def index
    @cats = Cat.all
    name = params[:name]
    color = params[:color]
    kid_friendly = params[:kid_friendly]
    age = params[:age]
    @cats = Cat.search(color)
    json_response(@cats)
  end

  def show
    @cat = Cat.find(params[:id])
    json_response(@cat)
  end

  def create
    @cat = Cat.create!(cat_params)
    json_response(@cat, :created)
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update!(cat_params)
      render status: 200, json: {
        message: "This cat has been updated succssfully."
      }
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
  end

  private

  def cat_params
    params.permit(:id, :name, :color, :kid_friendly, :age)
  end

end
