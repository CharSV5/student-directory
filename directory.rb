def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
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
    students << {name: name, cohort: cohort }
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Enter another name of student"
    name = gets.chomp
  end
    students 
end

def print(students)
  index = 0 
  while index < students.length 
    puts "#{students[index][:name]} (#{students[index][:cohort]} cohort)"
    index += 1 
  end 
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# Then we call the methods
students = input_students
print_header
print(students)
print_footer(students)

