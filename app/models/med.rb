class Med < ActiveRecord::Base
  attr_accessible :medication, :dose, :rote, :frequency, :date, :patient_id, :doctor_id
  belongs_to :patient
  belongs_to :doctor

  validates :medication, :date, :patient_id, :doctor_id, :presence => true

  after_create :update_meds_counter

  before_destroy :subtract_meds_counter

  def update_meds_counter
    patient.meds_counter += 1
    patient.save
  end

  def subtract_meds_counter
    patient.meds_counter -= 1
    patient.save
  end

end
