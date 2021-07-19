require './item.rb'

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")

        if @items << Item.new(title, deadline, description)
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        !@items[index].nil?
    end

    def swap(i1, i2)
        if valid_index?(i1) && valid_index?(i2)
            @items[i1], @items[i2] = @items[i2], @items[i1]
            return true
        else
            return false
        end
    end

    def [](index)
        if valid_index?(index)
            @items[index]
        else
            return nil
        end
    end

    def priority
        @items[0]
    end

    def print
        puts '--------------------------------------------------'
        puts @label.upcase.center(50)
        puts '--------------------------------------------------'
        puts 'Index'.ljust(10) + 'Item'.ljust(20) + 'Deadline'.ljust(10) + 'Completion'
        puts '--------------------------------------------------'
        @items.each_with_index do |item,i| 
            if @items[i].completion == false
                doneornot = '[ ]'
            else
                doneornot = '[✓]'
            end
            puts i.to_s.ljust(10) + item.title.ljust(20) + item.deadline.ljust(13) + doneornot
        end
        puts '--------------------------------------------------'
    end

    def print_full_item(index)
        if @items[index].completion == false
            doneornot = '[ ]'
        else
            doneornot = '[✓]'
        end
        if valid_index?(index)
            puts '--------------------------------------------------'
            puts index.to_s.ljust(10) + @items[index].title.ljust(20) + @items[index].deadline.ljust(13) + doneornot
            puts @items[index].description
            puts '--------------------------------------------------'
        end
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount = 1)
        index = index.to_i
        amount = amount.to_i
        return false if !valid_index?(index)
        previdx = index-1
        amount.times do
            break if previdx < 0
            @items[index], @items[previdx] = @items[previdx], @items[index]
            index -= 1
            previdx -= 1
        end
        return true
    end

    def down(index, amount = 1)
        index = index.to_i
        amount = amount.to_i
        return false if !valid_index?(index)
        nextidx = index+1
        amount.times do
            break if nextidx >= @items.length || nextidx == -1
            @items[index], @items[nextidx] = @items[nextidx], @items[index]
            index += 1
            nextidx += 1
        end
        return true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        if valid_index?(index)
            @items.delete_at(index)
            return true
        end
        return false
    end

    def purge
        @items.keep_if { |item| item.completion == false }
    end

end