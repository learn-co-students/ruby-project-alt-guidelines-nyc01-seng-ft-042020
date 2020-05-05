require_relative '../config/environment'

#puts "hello world"

cli = CommandLineInterface.new
cli.greeting

puts "Are you a student or a teacher?"
puts "Type in student or teacher to begin:"
type_of_user = gets.chomp.downcase
if type_of_user = "student"
    
elsif type_of_user = "teacher"

elsif 
    puts "Invalid input, please try again"
end
binding.pry