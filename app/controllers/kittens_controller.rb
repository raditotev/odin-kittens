class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Successfully saved"
      redirect_to @kitten
    else
      flash[:error] = "Problem saving this entry!"
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update_attributes(kitten_params)
    if @kitten.save
      flash[:success] = "Successfully updated"
      redirect_to @kitten
    else
      flash[:error] = "Update failed!"
    end
  end

  def destroy
    kitten = Kitten.find(params[:id])
    kitten.destroy
    flash[:success] = "Successfully deleted!"
    redirect_to root_url
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
