class ArtworkShare < ApplicationRecord

  validates :artwork_id, presence: true
  validates :viewer_id, presences: true
  validates :artwork_id, uniqueness: {scope: :viewer_id, message: "An artwork may only be shared with a user once."}

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User

end