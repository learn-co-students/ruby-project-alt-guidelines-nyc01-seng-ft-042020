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
            self.student_user
        elsif type_of_user == "teacher"
            self.teacher_user
        elsif type_of_user == "exit"
            puts "Have a great day!"
        end
    end

    def student_user #student user welcome message
        puts "Type in your full name to begin:"
        student_user = gets.chomp.titleize
        if Student.find_by(name: student_user)
            puts "Welcome #{student_user.titleize}!"
            
        else 
            puts "You are not authorized to access the portal. Please contact student services for additional support"
        end
    end

    # def student_assignments(student_user) #student user viewing assignments
    # end

    def teacher_user #teacher user welcome message
        puts "Type in your full name to begin:"
        teacher_user = gets.chomp.titleize
        if Teacher.find_by(name: teacher_user)
            puts "Welcome #{teacher_user.titleize}!"
            
        else 
            puts "You are not authorized to access the portal. Please contact your administrator for additional support"
        end
    end

    # def teacher_assignments(teacher_user) #teacher user viewing assignments
    # end

    # def run
    #     greeting
    #     puts "Are you a student or a teacher?"
    #     puts "Type in 'student' or 'teacher' to begin. Otherwise type in 'exit' to leave."
    #     type_of_user = gets.chomp.downcase
    #     until type_of_user == "student" || type_of_user == "teacher" || type_of_user == "exit"  
    #         puts "Invalid response. Type in 'student' or 'teacher' to begin. Otherwise type in 'exit' to leave."
    #         type_of_user = gets.chomp.downcase
    #     end
    #     if type_of_user == "student"
    #         puts "Type in your full name to begin:"
    #         student_user = gets.chomp.titleize
    #         if Student.find_by(name: student_user)
    #             puts "Welcome #{student_user.titleize}!"
    #         else 
    #             puts "You are not authorized to access the portal. Please contact student services for additional support"
    #         end
    #     elsif type_of_user == "teacher"
    #         puts "Type in your full name to begin:"
    #         teacher_user = gets.chomp.titleize
    #         if Teacher.find_by(name: teacher_user)
    #             puts "Welcome #{teacher_user.titleize}!"
    #             binding.pry
    #         else 
    #             puts "You are not authorized to access the portal. Please contact your administrator for additional support"
    #         end
    #     elsif type_of_user == "exit"
    #         puts "Have a great day!"
    #     end
    # end
    
end

