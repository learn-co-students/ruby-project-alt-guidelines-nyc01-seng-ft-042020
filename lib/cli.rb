class CommandLineInterface
    def greeting
        puts "Welcome to the Assignment Portal!"
    end

    def run
        greeting
        puts "Are you a student or a teacher?"
        puts "Type in student or teacher to begin:"
        type_of_user = gets.chomp.downcase
        if type_of_user == "student"
            puts "Type in your full name to begin:"
            student_user = gets.chomp.downcase
            puts "Welcome #{student_user.titleize}!"
        elsif type_of_user == "teacher"
            puts "Type in your full name to begin:"
            teacher_user = gets.chomp.downcase
            puts "Welcome #{teacher_user.titleize}!"
        elsif 
            puts "Invalid input, please try again" 
        elsif type_of_user == "exit"
            puts "Have a great day!"
        end
    end

end

