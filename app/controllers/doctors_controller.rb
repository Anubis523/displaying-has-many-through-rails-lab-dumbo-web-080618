class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.create(strong_params)
    @doctor.save
    redirect_to doctor_path(@doctor)
  end

  def show
    get_doctor
  end

  def edit
    get_doctor
  end

  def update
    get_doctor
    @doctor.update(strong_params)
    @doctor.save
    redirect_to doctor_path(@doctor)
  end

  private 
  def strong_params
    params.require(:doctor).permit(:name, :department)
  end

  def get_doctor
    @doctor = Doctor.find(params[:id])
  end
end
