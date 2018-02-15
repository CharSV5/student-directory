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
    
    if students.length == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    puts "Enter another name of student"
    name = gets.chomp
  end
    students 
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def  print_footer(students)
  if students.length == 0
    puts "There are no students"
  elsif students.length == 1
    puts "Overall, we have #{students.count} great student"
  else  
    puts "Overall, we have #{students.count} great students"
  end
end

def group_by_month(students)
  puts "Which month would you like to group by"
  month = gets.chomp
  # select the students from the chosen month
  st = students.select {|student| student[:cohort] == month}
  puts "In the #{month} cohort:"
  # display each name from chosen cohort
  st.each {|student| puts student[:name]}
end 

# Then we call the methods
students = input_students
print_header
print(students)
print_footer(students)

if students.length > 0
  group_by_month(students)
end
