module Settings
  class AreasController < ApplicationController
    before_action :set_area, only: [:show, :edit, :update, :destroy]

    def index
      @areas = Area.all
      respond_to do |format|
        format.html
        format.json { render json: AreaDatatable.new(params) }
      end
    end

    def new
      @area = Area.new
      render partial: "form"
    end

    def create
      @area = Area.new(area_params)
      respond_action @area, table: true
    end

    def edit
      render partial: "form"
    end

    def update
      respond_action @area, table: true
    end

    def destroy
      respond_action @area, table: true
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
