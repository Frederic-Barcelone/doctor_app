class VisitsController < ApplicationController

  before_filter :authenticate_doctor!

  def index
    @search = Visit.search(params[:search])
    @visits = @search.select('id, date, complaint, patient_id')
  end

  def show
    @visit = Visit.find(params[:id])
  end

  def new
    @visit = Visit.new(:patient_id => params[:patient], :doctor_id => current_doctor)
  end

  def create
    @visit = Visit.new(params[:visit])
    if @visit.save
      redirect_to @visit, :notice => "Successfully created visit."
    else
      render :action => 'new'
    end
  end

  def edit
    @visit = Visit.find(params[:id])
  end

  def update
    @visit = Visit.find(params[:id])
    if @visit.update_attributes(params[:visit])
      redirect_to visits_path, :notice => "Successfully updated visit."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    redirect_to visits_url, :notice => "Successfully destroyed visit."
  end
end
