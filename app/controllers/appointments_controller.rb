class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.create(strong_params)
    @appointment.save
    redirect_to appointment_path(@appointment)
  end

  def show
    find_appointment
  end

  def edit
    find_appointment
  end

  def update
    find_appointment
    @appointment.update(strong_params)
    @appointment.save
    redirect_to appointment_path(@appointment)
  end

  private 
  def strong_params
    params.require(:appointment).permit(:appointment_datetime, :patient_id, :doctor_id)
  end

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end
end
