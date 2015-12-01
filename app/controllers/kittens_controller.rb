class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.update(kitten_params)
  end

  def destroy
    kitten = Kitten.find(params[:id])
    kitten.destroy
  end

  private

  def kitten_params
    params.request(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
