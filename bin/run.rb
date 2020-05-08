require_relative '../config/environment'

# puts "hello world"

# def greet
#     puts 'Welcome to Felp, the best resource for restaurant information in the world!'
# end

# Above greet method moved into the CommandLineInterface model (in lib directory).

cli = CommandLineInterface.new 
cli.greet