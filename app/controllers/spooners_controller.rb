class SpoonersController < ApplicationController
  def index
    @spooners = Spooner.all
  end

  def new
  end

  def create
  end
end
