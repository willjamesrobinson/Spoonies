class SpoonersController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end
end
