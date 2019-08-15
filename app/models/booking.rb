class Booking < ApplicationRecord
  belongs_to :character
  belongs_to :user
  validates :character_id, uniqueness: { scope: [:user_id, :date] }
end
