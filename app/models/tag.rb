class Tag < ApplicationRecord
  has_many :tagged_photos
  has_many :photos, through: :tagged_photos

  default_scope { order('name ASC') }
end
