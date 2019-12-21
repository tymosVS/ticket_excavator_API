class Tiket < ApplicationRecord
  has_one :excavator, dependent: :destroy
end
