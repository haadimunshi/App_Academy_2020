require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        return true if @salaries.keys.include?(title)
        false
    end

    def >(new_startup)
        return true if @funding > new_startup.funding
        false
    end

    def hire(employee_name, title)
        if !valid_title?(title)
            raise "title not valid"
        else
            @employees << Employee.new(employee_name, title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if salary <= @funding
            employee.pay(salary)
            @funding -= salary
        else
            raise "not enough $$$"
        end
    end

    def payday
        @employees.map { |employee| pay_employee(employee) }
    end

    def average_salary
        total = 0
        @employees.each do |employee|
            total += @salaries[employee.title]
        end
        total / size
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(new_startup)
        @funding += new_startup.funding
        new_startup.salaries.each do |title, salary|
            @salaries[title] = salary if !@salaries.keys.include?(title)
        end
        new_startup.employees.map { |employee| @employees << employee }
        new_startup.close
    end
end
