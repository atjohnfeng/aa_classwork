class Artwork < ApplicationRecord

    validates :title, uniqueness: { scope: :artist_id, message: 'an artist can not have duplicate artwork titles' }

    belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User


    has_many :artwork_shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer
end