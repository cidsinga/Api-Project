class CatsController < ApplicationController

  def index
    if params[:kid_friendly]
      kid_friendly = params[:kid_friendly]
      @cats = Cat.kid_friendly(kid_friendly)
    end
    @cats = Cat.all
    name = params[:name]
    color = params[:color]
    age = params[:age]
    # @cats = Cat.search(color)
    @kid_friendly = Cat.kid_ok
    @most_recent = Cat.most_recent
    @age = Cat.age
    @random = Cat.random
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
