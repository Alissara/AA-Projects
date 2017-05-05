class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end


end

class Manager < Employee
  attr_reader :salary, :sub_ee

  def initialize(name, title, salary, boss, sub_ee)
    super(name, title, salary, boss)
    @sub_ee = sub_ee
  end

  def bonus(multiplier)
    subordinates * multiplier
  end

  def subordinates
    total_sal = 0
    @sub_ee.each do |ee|
      if ee.is_a?(Manager)
        total_sal += ee.salary + ee.subordinates
      else
        total_sal += ee.salary
      end
    end
    total_sal
  end

end

shawna = Employee.new('shawna', 'TA', 12_000, 'darren')
david = Employee.new('david', 'TA', 10_000, 'darren')
darren = Manager.new('darren', 'TA Manager', 78_000, 'ned', [shawna, david])
ned = Manager.new('ned', 'Founder', 1_000_000, nil, [darren])



p ned.bonus(5) == 500_000
p darren.bonus(4) == 88_000
p david.bonus(3) == 30_000
