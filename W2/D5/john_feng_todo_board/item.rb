class Item

    attr_accessor :title, :description
    attr_reader :deadline, :completion

    def self.valid_date?(date_string)
        ymd = date_string.split('-')
        years = '1234567890'
        months = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
        days = ['01', '02', '03', '04', '05', '06', '07', '08', '09']
        days += ('10'..'31').to_a
        return false if ymd[0].length != 4
        ymd[0].each_char { |num| return false if !years.include?(num) }
        
        return false if ymd[1].length != 2
        return false if !months.include?(ymd[1])

        return false if ymd[2].length != 2
        return false if !days.include?(ymd[2])

        return true
    end

    def initialize(title, deadline, description)
        @title = title
        @description = description

        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise 'Date is not valid. Re-enter a valid date in YYYY-MM-DD format.'
            return false
        end

        @completion = false
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise 'Date is not valid. Re-enter a valid date in YYYY-MM-DD format.'
            return false
        end
    end

    def toggle
        if @completion == false
            @completion = true
        else
            @completion = false
        end
    end

end