class Photo < ApplicationRecord
  has_many :tagged_photos
  has_many :tags, through: :tagged_photos
end
