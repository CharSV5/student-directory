@students = []

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # ask for cohort
    puts "What month did their cohort start?"
    cohort = gets.chomp
      if cohort == ""
        cohort = "november"
      end

    # add the student hash to the array
    @students << {name: name, cohort: cohort }

    if @students.length == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    puts "Enter another name of student"
    name = gets.chomp
  end
    @students
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def  print_footer
  if @students.length == 0
    puts "There are no students"
  elsif @students.length == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  # print menu and ask user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
       show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
end  

interactive_menu






