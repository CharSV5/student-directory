@students = [] 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  input_students_loop(name)
    @students
end

def input_students_loop(name)
  while !name.empty? do
    # ask for cohort
    puts "What month did their cohort start?"
    cohort = gets.chomp
      if cohort == ""
        cohort = "november"
      end
      # add the student hash to the array
    add_to_array(name, cohort)
    response
    puts "Enter another name of student"
    name = gets.chomp
  end
end

def response
   if @students.length == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
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
    process(STDIN.gets.chomp)
  end
end

def print_menu
  # print menu and ask user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"  
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  puts "You chose option #{selection}"
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
      puts "which file would you like to save to?"
       file = gets.chomp
      save_students(file)
    when "4"
      puts "which file would you like to load from?"
       filename = gets.chomp
      load_students(filename)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
end  

def save_students(file)
  # open file
  File.open(file, "w") do |file|
    # iterate over @students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

def load_students(filename = "students.csv")
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort.to_sym}
    end
  end
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? 
  if File.exist?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def add_to_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu





