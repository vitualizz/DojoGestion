module Settings
  class AreasController < ApplicationController
    before_action :set_area, only: [:show, :edit, :update, :destroy]

    def index
      @areas = Area.all
    end

    def new
      @area = Area.new
      render partial: "form"
    end

    private

    def set_area
      @area = Area.find(params[:id])
    end

    def area_params
      params.require(:area).permit(:name)
    end
  end
end
