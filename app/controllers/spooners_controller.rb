class SpoonersController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home, :index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_spooner, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @spooners = Spooner.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @spooners = Spooner.all
    end
    # The `geocoded` scope filters only flats with coordinates
    @markers = @spooners.geocoded.map do |spooner|
      {
        lat: spooner.latitude,
        lng: spooner.longitude,
        info_window: render_to_string(partial: "info_window", locals: {spooner: spooner})
      }
    end
    authorize @spooners
  end

  def show
    @review = Review.new
    authorize @spooner
    authorize @review
  end

  def new
    @spooner = Spooner.new
    authorize @spooner
  end

  def create
    @spooner = Spooner.new(spooner_params)
    @spooner.user = current_user
    authorize @spooner
    if @spooner.save
      redirect_to spooner_path(@spooner)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def home
    index
  end

  def edit
    authorize @spooner
  end

  def update
    @spooner.update(spooner_params_no_img)
    if params[:spooner][:img] != [""]
      params[:spooner][:img].each do |image|
        @spooner.img.attach(image)
      end
    end
    authorize @spooner
    redirect_to spooner_path(@spooner)
  end

  def destroy
    @spooner.destroy
    authorize @spooner
    redirect_to spooners_path, status: :see_other
  end

  private

  def spooner_params
    params.require(:spooner).permit(:name, :age, :spoon_type, :gender, :price, :overview, img: [])
  end

  def spooner_params_no_img
    params.require(:spooner).permit(:name, :age, :spoon_type, :gender, :price, :overview)
  end

  def set_spooner
    @spooner = Spooner.find(params[:id])
  end
end
