class CommandLineInterface
    def greeting
        puts "Welcome to the Assignment Portal!"
    end

    def run
        greeting
        puts "Are you a student or a teacher?"
        puts "Type in 'student' or 'teacher' to begin. Otherwise type in 'exit' to leave."
        type_of_user = gets.chomp.downcase
        until type_of_user == "student" || type_of_user == "teacher" || type_of_user == "exit"  
            puts "Invalid response. Type in 'student' or 'teacher' to begin. Otherwise type in 'exit' to leave."
            type_of_user = gets.chomp.downcase
        end
        if type_of_user == "student"
            puts "Type in your full name to begin:"
            student_user = gets.chomp.titleize
            
            # if 
                puts "Welcome #{student_user.titleize}!"
            # else 
            #     puts "Unauthorized user"
            # end
        elsif type_of_user == "teacher"
            puts "Type in your full name to begin:"
            teacher_user = gets.chomp.titleize

            # if 
                puts "Welcome #{teacher_user.titleize}!"
            # else
            #     puts "Unauthorized user"
            # end
        elsif type_of_user == "exit"
            puts "Have a great day!"
        end

    end
    
end

