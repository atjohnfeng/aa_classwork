class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork


    has_many :viewed_artworks,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

    has_many :shared_artworks,
    through: :viewed_artworks,
    source: :artwork
end