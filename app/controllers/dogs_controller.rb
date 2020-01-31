class DogsController < ApplicationController

  def index
    @dogs = Dog.all
    name = params[:name]
    color = params[:color]
    kid_friendly = params[:kid_friendly]
    age = params[:age]
    # @dogs = Dog.search(params[:name])
    @kid_friendly = Dog.kid_friendly
    @most_recent = Dog.most_recent
    json_response(@dogs)
  end

  def show
    @dog = Dog.find(params[:id])
    json_response(@dog)
  end

  def create
    @dog = Dog.create!(dog_params)
    json_response(@dog, :created)
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update!(dog_params)
      render status: 200, json: {
        message: "This dog has been updated succssfully."
      }
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
  end


  private

  def dog_params
    params.permit(:id, :name, :color, :kid_friendly, :age)
  end

end
