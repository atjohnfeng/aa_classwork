require './list.rb'

class TodoBoard

    def initialize
        @lists = Hash.new { |label, list| @lists[label] = list }
    end

    def get_command
        print "\nEnter a command: "
        cmd, listname, *args = gets.chomp.split(' ')

        case cmd
            when 'mktodo'
                @lists[listname].add_item(*args)
            when 'ls'
                @lists.each_key { |k| puts k }
            when 'up'
                @lists[listname].up(*args)
            when 'down'
                @lists[listname].down(*args)
            when 'swap'
                @lists[listname].swap(args[0].to_i, args[1].to_i)
            when 'sort'
                @lists[listname].sort_by_date!
            when 'priority'
                @lists[listname].print_priority
            when 'print'
                if args.length == 0
                    @lists[listname].print
                else
                    @lists[listname].print_full_item(args[0].to_i)
                end
            when 'toggle'
                @lists[listname].toggle_item(args[0].to_i)
            when 'quit'
                return false
            when 'rm'
                @lists[listname].remove_item(args[0].to_i)
            when 'purge'
                @lists[listname].purge
            when 'mklist'
                @lists[listname] = List.new(listname)
            when 'showall'
                @lists.each do |key, value|
                    @lists[key].print
                end
            else
                print "Sorry, that command is not recognized."
            end
        true
    end

    def run
        
        while get_command == true
            get_command
        end

    end

end

TodoBoard.new.run