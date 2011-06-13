class Med < ActiveRecord::Base
  attr_accessible :medication, :dose, :rote, :frequency, :date, :patient_id, :doctor_id
  belongs_to :patient
  belongs_to :doctor

  validates :medication, :date, :patient_id, :doctor_id, :presence => true

end
