class Artwork < ApplicationRecord

    validates :title, uniqueness: { scope: :artist_id, message: 'an artist can not have duplicate artwork titles' }

    belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

end