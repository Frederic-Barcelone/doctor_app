class History < ActiveRecord::Base
  attr_accessible :patient_id, :allergies, :social, :medical, :family
  belongs_to :patient
end
