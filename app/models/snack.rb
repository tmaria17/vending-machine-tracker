class Snack < ApplicationRecord
  belongs_to :machine
#  has_many :machines, through: :machine_snacks

  validates_presence_of :name, :price


    def self.average_price
      average(:price)
    end



end
