class Visit < ActiveRecord::Base
  attr_accessible :date, :complaint, :diagnosis, :observation, :doctor_id, :patient_id
  belongs_to :doctor
  belongs_to :patient

  validates :date, :complaint, :doctor_id, :patient_id, :presence => true

  after_create :update_visit_counter

  before_destroy :subtract_visit_counter

  def update_visit_counter
    doctor.visit_counter += 1
    doctor.save
  end

  def subtract_visit_counter
    doctor.visit_counter -= 1
    doctor.save
  end

end
