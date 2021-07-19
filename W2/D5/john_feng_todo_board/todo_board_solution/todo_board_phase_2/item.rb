class Item
    def self.valid_date?(s)
        parts = s.split('-').map(&:to_i)
        year, month, day = parts
        return false if parts.length != 3
        return false if !(0..12).include?(month)
        return false if !(0..31).include?(day)
        true
    end

    attr_reader :deadline, :done
    attr_accessor :title, :description

    def initialize(title, deadline, description)
        raise 'deadline is not valid' if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
        @done = false
    end

    def deadline=(new_deadline)
        raise 'deadline is not valid' if !Item.valid_date?(new_deadline)
        @deadline = new_deadline
    end

    def toggle
        @done = !@done
    end
end
