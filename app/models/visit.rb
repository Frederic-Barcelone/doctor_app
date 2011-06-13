class Visit < ActiveRecord::Base
  attr_accessible :date, :complaint, :diagnosis, :observation, :doctor_id, :patient_id
  belongs_to :doctor
  belongs_to :patient

  validates :date, :complaint, :doctor_id, :patient_id, :presence => true

end
