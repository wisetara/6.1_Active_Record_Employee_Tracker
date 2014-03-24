require 'active_record'
require './lib/task'
require './lib/list'
require './lib/create_lists'
require 'pry'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Welcome to the To Do list!"
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "Press 'a' to add a task, 'l' to list your tasks, or 'd' to mark a task as done."
    puts "If you would like to add a list type 'al'"
    puts "Please press 'vl' to view all of your lists"
    puts "Press 'e' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      add
    when 'l'
      list
    when 'd'
      mark_done
    when 'al'
      add_list
    when 'vl'
      view_list
    when 'e'
      puts "Good-bye!"
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def add
  List.all.each { |list| puts list.name }
  puts "Type the name of the list you would like to add to"
  list_name = gets.chomp
  puts "What do you need to do?"
  task_name = gets.chomp
  #task = Task.new({:name => task_name, :done => false})
  #task.save
  list = List.where({:name => list_name}).first
  task = list.tasks.new({:name => task_name})
  task.save
  binding.pry
  puts "All done!"
  menu

  "'#{task_name}' has been added to your To Do list."
end

def list
  puts "Here is everything you need to do:"
  Task.not_done.each { |task| puts task.name }
end

def mark_done
  puts "Which of these tasks would you like to mark as done?"
  Task.all.each { |task| puts task.name }
  done_task_name = gets.chomp
  done_task = Task.where({:name => done_task_name}).first
  done_task.update({:done => true})
end

def add_list
  puts "Please enter a title for your list"
  list_title = gets.chomp
  new_list = List.new({:name => list_title})
  new_list.save
  menu
end

def view_list
  puts "Here are the lists you have:"
  List.all.each { |list| puts list.name }
  puts "If you would like to view the tasks that a certain list contains, type the list name"
  puts "Otherwise, press 'm' to go to the main menu"
  view_list_answer = gets.chomp
  case view_list_answer
    when 'm'
      menu
    else
       list = List.where({:name => view_list_answer}).first
       list.tasks.each {|task| puts task.name}
       menu
  end
end

welcome
