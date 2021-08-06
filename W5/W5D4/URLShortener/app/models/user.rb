class User < ApplicationRecord

    validates :email, presence: true, uniqueness: true

    has_many :short_urls,
    primary_key: :id,
    

end