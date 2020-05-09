Student.delete_all
Teacher.delete_all
Assignment.delete_all


s1 = Student.create(name: "Harry Potter")
s2 = Student.create(name: "Hermione Granger")
s3 = Student.create(name: "Ron Weasley")
s4 = Student.create(name: "Ginny Weasley")
s5 = Student.create(name: "Draco Malfoy")

t1 = Teacher.create(name: "Albus Dumbledore", subject: "History of Hogwarts")
t2 = Teacher.create(name: "Severus Snape", subject: "Potions")
t3 = Teacher.create(name: "Filius Flitwick", subject: "Charms")
t4 = Teacher.create(name: "Remus Lupin", subject: "Defense Against the Dark Arts")
t5 = Teacher.create(name: "Pomona Sprout", subject: "Herbology")

Assignment.create(task: "Who founded each house at Hogwarts? Write a summary about each person.", student_id: s1.id, teacher_id: t1.id)
Assignment.create(task: "Write a paragraph summarizing the most important elements of a potion", student_id: s1.id, teacher_id: t2.id)
Assignment.create(task: "Prepare to discuss three uses for charm spells", student_id: s1.id, teacher_id: t3.id)
Assignment.create(task: "Be ready to discuss the effects of the three unforgivable curses?", student_id: s1.id, teacher_id: t4.id)
Assignment.create(task: "What are the benefits of a mandrake? Write your response in two paragraphs", student_id: s1.id, teacher_id: t5.id)
Assignment.create(task: "Who founded each house at Hogwarts? Write a summary about each person.", student_id: s2.id, teacher_id: t1.id)
Assignment.create(task: "Write a paragraph summarizing the most important elements of a potion", student_id: s2.id, teacher_id: t2.id)
Assignment.create(task: "Prepare to discuss three uses for charm spells", student_id: s2.id, teacher_id: t3.id)
Assignment.create(task: "Be ready to discuss the effects of the three unforgivable curses?", student_id: s2.id, teacher_id: t4.id)
Assignment.create(task: "What are the benefits of a mandrake? Write your response in two paragraphs", student_id: s2.id, teacher_id: t5.id)
Assignment.create(task: "Who founded each house at Hogwarts? Write a summary about each person.", student_id: s3.id, teacher_id: t1.id)
Assignment.create(task: "Write a paragraph summarizing the most important elements of a potion", student_id: s3.id, teacher_id: t2.id)
Assignment.create(task: "Prepare to discuss three uses for charm spells", student_id: s3.id, teacher_id: t3.id)
Assignment.create(task: "Be ready to discuss the effects of the three unforgivable curses?", student_id: s3.id, teacher_id: t4.id)
Assignment.create(task: "What are the benefits of a mandrake? Write your response in two paragraphs", student_id: s3.id, teacher_id: t5.id)
Assignment.create(task: "Who founded each house at Hogwarts? Write a summary about each person.", student_id: s4.id, teacher_id: t1.id)
Assignment.create(task: "Write a paragraph summarizing the most important elements of a potion", student_id: s4.id, teacher_id: t2.id)
Assignment.create(task: "Prepare to discuss three uses for charm spells", student_id: s4.id, teacher_id: t3.id)
Assignment.create(task: "Be ready to discuss the effects of the three unforgivable curses?", student_id: s4.id, teacher_id: t4.id)
Assignment.create(task: "What are the benefits of a mandrake? Write your response in two paragraphs", student_id: s4.id, teacher_id: t5.id)
Assignment.create(task: "Who founded each house at Hogwarts? Write a summary about each person.", student_id: s5.id, teacher_id: t1.id)
Assignment.create(task: "Write a paragraph summarizing the most important elements of a potion", student_id: s5.id, teacher_id: t2.id)
Assignment.create(task: "Prepare to discuss three uses for charm spells", student_id: s5.id, teacher_id: t3.id)
Assignment.create(task: "Be ready to discuss the effects of the three unforgivable curses?", student_id: s5.id, teacher_id: t4.id)
Assignment.create(task: "What are the benefits of a mandrake? Write your response in two paragraphs", student_id: s5.id, teacher_id: t5.id)
Assignment.create(task: "Write a paragraph about your favorite potion", student_id: s1.id, teacher_id: t2.id)
Assignment.create(task: "Write a paragraph about your favorite potion", student_id: s2.id, teacher_id: t2.id)
Assignment.create(task: "Write a paragraph about your favorite potion", student_id: s3.id, teacher_id: t2.id)
Assignment.create(task: "Write a paragraph about your favorite potion", student_id: s4.id, teacher_id: t2.id)
Assignment.create(task: "Write a paragraph about your favorite potion", student_id: s5.id, teacher_id: t2.id)


