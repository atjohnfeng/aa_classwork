class Post < ApplicationRecord
    validates :title, :sub_id, :author_id, presence: true

    belongs_to :sub,
    foreign_key: :sub_id,
    class_name: :Sub

    has_many :cross_posted_subs,
    foreign_key: :post_id,
    class_name: :PostSub

    def is_owner?
        self.author_id == current_user.id
    end

end
