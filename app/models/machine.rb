class Machine < ApplicationRecord
  #has_many :machine_snacks
  has_many :snacks#, through: :machine_snacks

  validates_presence_of :location

  belongs_to :owner

end
