class Employee

    attr_reader :salary

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier * 0.01
    end

end

class Manager < Employee

    def initialize(name, title, salary, boss, employees)
        super(name, title, salary, boss)
        @employees = employees
    end

    def bonus(multiplier)
        @employees.inject(0) { |acc, ele| acc + ele.salary } * multiplier * 0.01
    end

end

shawna = Employee.new("Shawna", "TA", 12000, "Aaron")
david = Employee.new("David", "TA", 10000, "Aaron")
daren = Manager.new("Daren", "Manager", 78000, "Ned", [shawna, david])

p shawna.bonus(5)
p daren.bonus(4)
p david.bonus(3)