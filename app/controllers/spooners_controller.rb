class SpoonersController < ApplicationController
  def index
    @spooners = Spooner.all
  end

  def show
    @spooner = Spooner.find(params[:id])
  end

  def new
    @spooner = Spooner.new
  end

  def create
    @spooner = Spooner.new(spooner_params)
    if @spooner.save
      redirect_to spooner_path(@spooner)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def spooner_params
    params.require(:spooner).permit(:name, :age, :spoon_type, :gender, :price, :overview, :img)
  end
end
