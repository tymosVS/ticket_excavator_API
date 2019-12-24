class Excavator < ApplicationRecord
  belongs_to :tiket

  validates :company_name, presence: true
  validates :address, presence: true
  validates :sity, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :crew_on_site, presence: true
  validates :tiket_id, presence: true
end
