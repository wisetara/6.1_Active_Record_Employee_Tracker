require 'active_record'
require './lib/employee'
require './lib/division'
require 'pry'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu
 puts "\n\n\n\nWelcome!!!!!! Make sure your employees are doing their jobs!!!"
 puts "\n\n\n"
 puts "Press N to add a new employee"
 puts "Press V to view your employees"
 puts "Press D to add a new division"
 puts "Press L to list your divisions"
 puts "Press X to leave.......:("
 main_answer = gets.chomp.upcase
 case main_answer
  when "N" then add_employee
  when "V" then view_employees
  when "D" then add_division
  when "L" then list_divisions
  when "X" then "GOOD BYE!"
  else "PLEASE ENTER A VALID KEY!"
    main_menu
  end
end

def add_employee
  system('clear')
  puts "Please enter the employee's name:"
  name_entry = gets.chomp
  employee = Employee.new({:name => name_entry})
  employee.save
  puts "#{name_entry} added!"
  main_menu
end

def view_employees
  system('clear')
  puts "Here are all of your employees:"
  Employee.all.each do |employee|
    puts employee.name
  end
end

def add_division
  system('clear')
  puts "Please enter the division name:"
  division_entry = gets.chomp
  division = Division.new({:name => division_entry})
  division.save
  puts "#{division_entry} added!"
  main_menu
end
main_menu
