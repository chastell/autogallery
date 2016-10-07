class Photo < ApplicationRecord
  has_many :tagged_photos
  has_many :tags, through: :tagged_photos

  has_attached_file :image,
    styles: { thumbnail: "480x320>" }

  validates_attachment :image,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
