class Patient < ActiveRecord::Base
  attr_accessible :first_name, :middle_name, :last_name, :birthdate,
                  :phone, :address, :female, :bloodgroup, :history_attributes
  has_one :history
  has_many :meds, :dependent => :destroy
  has_many :visits, :dependent => :destroy
  has_many :doctors, :through => :visits

  BLOOD = ["O Positive", "0 Negative", "A positive", "A Negative", "B Positive", "B negative", "AB Positive", "AB Negative"]

  attr_reader :full_name

  validates :first_name, :middle_name, :last_name, :birthdate, :female, :address, :presence => true
  validates_inclusion_of :bloodgroup, :in => BLOOD
  validates_length_of :phone, :in => 9..15

  accepts_nested_attributes_for :history

  def full_name
    " #{last_name} " + " #{first_name  } " + " #{middle_name} "
  end

  def social_history
    history.social
  end

  def medical_history
    history.medical
  end

  def allergies
    history.allergies
  end

  def family_history
    history.medical
  end

end
