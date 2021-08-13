class Cat < ApplicationRecord

    validates :name, presence: true
    validates :sex, presence: true
    validates :birth_date, presence: true
    validates :description, presence: true
    validates :color, presence: true
    validates :color, inclusion: { in: %w(black orange gold gray white), message: 'That is not a valid color.' }

    def self.age(feline)
        return nil if feline.nil?
        return Date.today.year - feline.birth_date.year
    end

end