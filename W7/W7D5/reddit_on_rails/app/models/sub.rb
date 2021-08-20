class Sub < ApplicationRecord
    validates :title, :description, :mod_id, presence: true
    validates :title, uniqueness: true

    has_many :posts,
    foreign_key: :sub_id,
    class_name: :Post,
    dependent: :destroy

    has_many :cross_posts,
    foreign_key: :sub_id,
    class_name: :PostSub

end
