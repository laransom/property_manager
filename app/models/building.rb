class Building < ActiveRecord::Base
  belongs_to :owner

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, numericality: { only_integer: true }, length: { is: 5 }
end
