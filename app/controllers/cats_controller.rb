class CatsController < ApplicationController

  def index
    name = params[:name]
    color = params[:color]
    kid_friendly = params[:kid_friendly]
    age = params[:age]
    @cats = Cat.all
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

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
