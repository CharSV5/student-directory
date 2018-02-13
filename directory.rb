# put students in array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
] 
# print data
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end

# We print the numer of students
puts "Overall, we have #{students.count} great students"
