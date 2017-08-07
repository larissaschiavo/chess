require "byebug"
class Employee
  attr_reader :salary

  def initialize(name, salary, title, boss)
    @name = name
    @salary = salary
    @title = title
    @boss = boss
    @boss.add_employee(self) if @boss != nil
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee
  def initialize(name, salary, title, boss)
    @all_employees = []
    super(name, salary, title, boss)
  end

  def subordinate_salary
    salary_total = 0
    @all_employees.each do |employee|
      salary_total += employee.salary
      if employee.is_a?(Manager)
        salary_total += employee.subordinate_salary
      end
    end
    salary_total
  end

  def bonus(multiplier)
    subordinate_salary * multiplier
  end

  def add_employee(employee)
    @all_employees << employee
  end

end

ned = Manager.new("ned", 1000000, "founder", nil)
darren = Manager.new("darren", 78000, "ta manager", ned)
shawna = Employee.new("shawna", 12000, "ta", darren)
david = Employee.new("david", 10000, "ta", darren)



p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
