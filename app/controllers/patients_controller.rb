class PatientsController < ApplicationController
  before_filter :authenticate_doctor!

  def index
    @search = Patient.search(params[:search])
    @patients = @search.select("id, first_name, last_name, middle_name, birthdate")
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
    @history = @patient.build_history
  end

  def create
    @patient = Patient.new(params[:patient])
    if @patient.save
      redirect_to @patient, :notice => "Successfully created patient."
    else
      render :action => 'new'
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update_attributes(params[:patient])
      redirect_to @patient, :notice  => "Successfully updated patient."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_url, :notice => "Successfully destroyed patient."
  end
end
