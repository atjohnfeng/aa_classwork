require_relative "./employee.rb"
require 'byebug'

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(str)
        salaries.has_key?(str)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(name, title)
        if valid_title?(title)
            employees << Employee.new(name, title)
        else
            raise_error
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        paycheck = @salaries[employee.title]
        if paycheck <= @funding
            employee.pay(paycheck)
            @funding -= paycheck
        else
            raise_error
        end
    end

    def payday
        @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        total = 0
        @employees.each { |em| total += @salaries[em.title] }
        total / employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each { |k, v| @salaries[k] = v if !@salaries.has_key?(k) }
        @employees += startup.employees
        startup.close
    end

end
