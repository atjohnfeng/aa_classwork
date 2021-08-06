class ShortenedUrl < ApplicationRecord

    validates :user_id, presence: true
    validates :long_url, presence: true
    validates :short_url, presence: true, uniqueness: true  

    belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

end 