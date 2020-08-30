professor = Professor.create name: "Luis Humberto", department: "Historia de Primaria", email: "wicho@sep.gob.mx"
quiz = professor.quizzes.create name: "Historia Mexicana - Sexto Grado"
quiz.questions.create query: "Cual es el nombre del primer presidente Mexicano?", option_a: "Emiliano Zapata", option_b: "Guadalupe Victoria", option_c: "Benito Juarez", option_d: "La Malinche", correct_option: "2"
quiz.questions.create query: "Quien no es un personaje de la Revolución Mexicana?", option_a: "Porfirio Díaz", option_b: "Francisco I. Madero", option_c: "Victoriano Huerta", option_d: "Miguel de la Madrid", correct_option: "4"
quiz.questions.create query: "Cuantos presidentes ha tenido los Estados Unidos Mexicanos?", option_a: "58", option_b: "60", option_c: "54", option_d: "71", correct_option: "1"
quiz.questions.create query: "Que se celebra el 5 de Mayo?", option_a: "Día de la Bandera", option_b: "Promulgación de la Constitución Mexicana", option_c: "Batalla de Puebla", option_d: "Ninguna de las anteriores.", correct_option: "3"

