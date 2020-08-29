professor = Professor.create name: "Wicho"
quiz = professor.quizzes.create name: "Estructura de Datos Parcial 1"
questions = quiz.questions.create query: "Cuantos Beagles hay en BeagleTown?", option_a: "10", option_b: "20", option_c: "30", option_d: "40", correct_option: "1"
