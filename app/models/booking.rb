class Booking < ApplicationRecord
  belongs_to :character
  belongs_to :user
  validates :character_id, uniqueness: { scope: [:user_id, :date] }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
