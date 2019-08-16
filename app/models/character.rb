class Character < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :photo, PhotoUploader
  acts_as_taggable_on :tags
  include PgSearch
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description],
    using: {
      tsearch: { prefix: true
      }
    }
end
