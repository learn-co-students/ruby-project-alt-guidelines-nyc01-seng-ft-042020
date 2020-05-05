Student.delete_all
Teacher.delete_all
Assignment.delete_all


s1 = Student.create(name: Faker::Name.name)
s2 = Student.create(name: Faker::Name.name)
s3 = Student.create(name: Faker::Name.name)
s4 = Student.create(name: Faker::Name.name)
s5 = Student.create(name: Faker::Name.name)

t1 = Teacher.create(name: Faker::Name.name, subject: "Math")
t2 = Teacher.create(name: Faker::Name.name, subject: "Science")
t3 = Teacher.create(name: Faker::Name.name, subject: "History")
t4 = Teacher.create(name: Faker::Name.name, subject: "English")
t5 = Teacher.create(name: Faker::Name.name, subject: "Latin")

Assignment.create(task: "Create and solve 3 word problems using the quadratic formula", student_id: s1.id, teacher_id: t1.id)
Assignment.create(task: "Summarize the process of protein synthesis including transcription and translation", student_id: s1.id, teacher_id: t2.id)
Assignment.create(task: "Write a DBQ summarizing the economic, social, and political causes of the French Revolution", student_id: s1.id, teacher_id: t3.id)
Assignment.create(task: "What is the significance of dreams in Of Mice and Men?", student_id: s1.id, teacher_id: t4.id)
Assignment.create(task: "Translate your introduction paragraphs into latin", student_id: s1.id, teacher_id: t5.id)
Assignment.create(task: "Create and solve 3 word problems using the quadratic formula", student_id: s2.id, teacher_id: t1.id)
Assignment.create(task: "Summarize the process of protein synthesis including transcription and translation", student_id: s2.id, teacher_id: t2.id)
Assignment.create(task: "Write a DBQ summarizing the economic, social, and political causes of the French Revolution", student_id: s2.id, teacher_id: t3.id)
Assignment.create(task: "What is the significance of dreams in Of Mice and Men?", student_id: s2.id, teacher_id: t4.id)
Assignment.create(task: "Translate your introduction paragraphs into latin", student_id: s2.id, teacher_id: t5.id)
Assignment.create(task: "Create and solve 3 word problems using the quadratic formula", student_id: s3.id, teacher_id: t1.id)
Assignment.create(task: "Summarize the process of protein synthesis including transcription and translation", student_id: s3.id, teacher_id: t2.id)
Assignment.create(task: "Write a DBQ summarizing the economic, social, and political causes of the French Revolution", student_id: s3.id, teacher_id: t3.id)
Assignment.create(task: "What is the significance of dreams in Of Mice and Men?", student_id: s3.id, teacher_id: t4.id)
Assignment.create(task: "Translate your introduction paragraphs into latin", student_id: s3.id, teacher_id: t5.id)
Assignment.create(task: "Create and solve 3 word problems using the quadratic formula", student_id: s4.id, teacher_id: t1.id)
Assignment.create(task: "Summarize the process of protein synthesis including transcription and translation", student_id: s4.id, teacher_id: t2.id)
Assignment.create(task: "Write a DBQ summarizing the economic, social, and political causes of the French Revolution", student_id: s4.id, teacher_id: t3.id)
Assignment.create(task: "What is the significance of dreams in Of Mice and Men?", student_id: s4.id, teacher_id: t4.id)
Assignment.create(task: "Translate your introduction paragraphs into latin", student_id: s4.id, teacher_id: t5.id)
Assignment.create(task: "Create and solve 3 word problems using the quadratic formula", student_id: s5.id, teacher_id: t1.id)
Assignment.create(task: "Summarize the process of protein synthesis including transcription and translation", student_id: s5.id, teacher_id: t2.id)
Assignment.create(task: "Write a DBQ summarizing the economic, social, and political causes of the French Revolution", student_id: s5.id, teacher_id: t3.id)
Assignment.create(task: "What is the significance of dreams in Of Mice and Men?", student_id: s5.id, teacher_id: t4.id)
Assignment.create(task: "Translate your introduction paragraphs into latin", student_id: s5.id, teacher_id: t5.id)
Assignment.create(task: "In a clear descriptive paragraph, explain how to read the amino acid table", student_id: s1.id, teacher_id: t2.id)
Assignment.create(task: "In a clear descriptive paragraph, explain how to read the amino acid table", student_id: s2.id, teacher_id: t2.id)
Assignment.create(task: "In a clear descriptive paragraph, explain how to read the amino acid table", student_id: s3.id, teacher_id: t2.id)
Assignment.create(task: "In a clear descriptive paragraph, explain how to read the amino acid table", student_id: s4.id, teacher_id: t2.id)
Assignment.create(task: "In a clear descriptive paragraph, explain how to read the amino acid table", student_id: s5.id, teacher_id: t2.id)


