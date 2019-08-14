class Booking < ApplicationRecord
  belongs_to :character
  belongs_to :user
  t.string "status", default: :pending:
end
