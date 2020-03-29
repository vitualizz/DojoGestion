class TeachersController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: TeacherDatatable.new(params) }
    end
  end

end
