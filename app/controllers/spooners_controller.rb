class SpoonersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_spooner, only: [:show, :edit, :update, :destroy]

  def index
    @spooners = Spooner.all
  end

  def show
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

  def home
  end

  def edit
  end

  def update
    @spooner.update(spooner_params)
    redirect_to spooner_path(@spooner)
  end

  def destroy
    @spooner.destroy
    redirect_to spooners_path, status: :see_other
  end

  private

  def spooner_params
    params.require(:spooner).permit(:name, :age, :spoon_type, :gender, :price, :overview, :img)
  end

  def set_spooner
    @spooner = Spooner.find(params[:id])
  end
end
