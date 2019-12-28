class Tiket < ApplicationRecord
  has_one :excavator, dependent: :destroy

  validates :request_number, presence: true, format: { with: /\A\d+\-\d+\z/,
    message: "only allows letters" }, uniqueness: true
  validates :sequence_number, presence: true, format: { with: /\A\d+\z/,
    message: "only numbers" }, uniqueness: true
  validates :request_type, presence: true
  validates :response_due_date_time, presence: true
  validates :primary_service_area_code, presence: true
  validates :additional_service_area_codes, presence: true
  validates :dig_site_info, presence: true
end
