class MedsController < ApplicationController
  before_filter :authenticate_doctor!

  def index
    @search = Med.search(params[:search])
    @meds = @search.select("id, medication, date, patient_id")
  end

  def show
    @med = Med.find(params[:id])
  end

  def new
    @med = Med.new(:patient_id => params[:patient], :doctor_id => current_doctor)
  end

  def create
    @med = Med.new(params[:med])
    if @med.save
      redirect_to meds_path, :notice => "Successfully created med."
    else
      render :action => 'new'
    end
  end

  def edit
    @med = Med.find(params[:id])
  end

  def update
    @med = Med.find(params[:id])
    if @med.update_attributes(params[:med])
      redirect_to @med, :notice => "Successfully updated med."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @med = Med.find(params[:id])
    @med.destroy
    redirect_to meds_url, :notice => "Successfully destroyed med."
  end
end
