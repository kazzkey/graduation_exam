Subject.seed(
  :id,
  { id: 1, name: 'Japanese' },
  { id: 2, name: 'English' },
  { id: 3, name: 'Math' },
)

User.seed(
  :id,
  { id: 1, student_id: 1, name: 'Admin', email: Faker::Internet.email, password: 'password', admin: true },
  { id: 2, student_id: 200501, name: Faker::JapaneseMedia::OnePiece.character, email: Faker::Internet.email, password: 'password' },
  { id: 3, student_id: 200502, name: Faker::JapaneseMedia::OnePiece.character, email: Faker::Internet.email, password: 'password' },
  { id: 4, student_id: 200503, name: Faker::JapaneseMedia::OnePiece.character, email: Faker::Internet.email, password: 'password' },
  { id: 5, student_id: 200504, name: Faker::JapaneseMedia::OnePiece.character, email: Faker::Internet.email, password: 'password' },
  { id: 6, student_id: 200505, name: Faker::JapaneseMedia::OnePiece.character, email: Faker::Internet.email, password: 'password' },
)

Exam.seed(
  :id,
  { id: 1, title: 'test1', deadline: '2020-12-31', release: true, subject_id: 1 },
  { id: 2, title: 'test2', deadline: '2020-12-31', release: true, subject_id: 1 },
  { id: 3, title: 'test3', deadline: '2020-12-31', release: true, subject_id: 1 },
  { id: 4, title: 'test4', deadline: '2020-12-31', release: true, subject_id: 1 },
  { id: 5, title: 'test5', deadline: '2020-12-31', release: true, subject_id: 1 },
)

Question.seed(
  :id,
  { id: 1, content: Faker::JapaneseMedia::OnePiece.akuma_no_mi, correct_answer: 1, exam_id: 1 },
  { id: 2, content: Faker::JapaneseMedia::OnePiece.akuma_no_mi, correct_answer: 2, exam_id: 1 },
  { id: 3, content: Faker::JapaneseMedia::OnePiece.akuma_no_mi, correct_answer: 3, exam_id: 1 },
  { id: 4, content: Faker::JapaneseMedia::OnePiece.akuma_no_mi, correct_answer: 4, exam_id: 1 },
  { id: 5, content: Faker::JapaneseMedia::OnePiece.akuma_no_mi, correct_answer: 1, exam_id: 1 },

  { id: 6, content: Faker::JapaneseMedia::OnePiece.location, correct_answer: 1, exam_id: 2 },
  { id: 7, content: Faker::JapaneseMedia::OnePiece.location, correct_answer: 2, exam_id: 2 },
  { id: 8, content: Faker::JapaneseMedia::OnePiece.location, correct_answer: 3, exam_id: 2 },
  { id: 9, content: Faker::JapaneseMedia::OnePiece.location, correct_answer: 4, exam_id: 2 },
  { id: 10, content: Faker::JapaneseMedia::OnePiece.location, correct_answer: 1, exam_id: 2 },

  { id: 11, content: Faker::JapaneseMedia::OnePiece.island, correct_answer: 1, exam_id: 3 },
  { id: 12, content: Faker::JapaneseMedia::OnePiece.island, correct_answer: 2, exam_id: 3 },
  { id: 13, content: Faker::JapaneseMedia::OnePiece.island, correct_answer: 3, exam_id: 3 },
  { id: 14, content: Faker::JapaneseMedia::OnePiece.island, correct_answer: 4, exam_id: 3 },
  { id: 15, content: Faker::JapaneseMedia::OnePiece.island, correct_answer: 1, exam_id: 3 },

  { id: 16, content: Faker::JapaneseMedia::OnePiece.quote, correct_answer: 1, exam_id: 4 },
  { id: 17, content: Faker::JapaneseMedia::OnePiece.quote, correct_answer: 2, exam_id: 4 },
  { id: 18, content: Faker::JapaneseMedia::OnePiece.quote, correct_answer: 3, exam_id: 4 },
  { id: 19, content: Faker::JapaneseMedia::OnePiece.quote, correct_answer: 4, exam_id: 4 },
  { id: 20, content: Faker::JapaneseMedia::OnePiece.quote, correct_answer: 1, exam_id: 4 },

  { id: 21, content: Faker::JapaneseMedia::OnePiece.sea, correct_answer: 1, exam_id: 5 },
  { id: 22, content: Faker::JapaneseMedia::OnePiece.sea, correct_answer: 2, exam_id: 5 },
  { id: 23, content: Faker::JapaneseMedia::OnePiece.sea, correct_answer: 3, exam_id: 5 },
  { id: 24, content: Faker::JapaneseMedia::OnePiece.sea, correct_answer: 4, exam_id: 5 },
  { id: 25, content: Faker::JapaneseMedia::OnePiece.sea, correct_answer: 1, exam_id: 5 },

)

AnswerSheet.seed(
  :id,
  { id: 1, score: 5, exam_id: 1, user_id: 2},
  { id: 2, score: 2, exam_id: 1, user_id: 3},
  { id: 3, score: 1, exam_id: 1, user_id: 4},
  { id: 4, score: 3, exam_id: 1, user_id: 5},
  { id: 5, score: 0, exam_id: 1, user_id: 6},

  { id: 6, score: 4, exam_id: 2, user_id: 2},
  { id: 7, score: 3, exam_id: 2, user_id: 3},
  { id: 8, score: 2, exam_id: 2, user_id: 4},
  { id: 9, score: 3, exam_id: 2, user_id: 5},
  { id: 10, score: 2, exam_id: 2, user_id: 6},

  { id: 11, score: 2, exam_id: 3, user_id: 2},
  { id: 12, score: 3, exam_id: 3, user_id: 3},
  { id: 13, score: 5, exam_id: 3, user_id: 4},
  { id: 14, score: 1, exam_id: 3, user_id: 5},
  { id: 15, score: 4, exam_id: 3, user_id: 6},

  { id: 16, score: 1, exam_id: 4, user_id: 2},
  { id: 17, score: 2, exam_id: 4, user_id: 3},
  { id: 18, score: 3, exam_id: 4, user_id: 4},
  { id: 19, score: 4, exam_id: 4, user_id: 5},
  { id: 20, score: 5, exam_id: 4, user_id: 6},

  { id: 21, score: 3, exam_id: 5, user_id: 2},
  { id: 22, score: 4, exam_id: 5, user_id: 3},
  { id: 23, score: 5, exam_id: 5, user_id: 4},
  { id: 24, score: 1, exam_id: 5, user_id: 5},
  { id: 25, score: 5, exam_id: 5, user_id: 6},
)

Answer.seed(
  :id,
  { id: 1, choice: 1, answer_sheet_id: 1, question_id: 1},
  { id: 2, choice: 2, answer_sheet_id: 1, question_id: 2},
  { id: 3, choice: 3, answer_sheet_id: 1, question_id: 3},
  { id: 4, choice: 4, answer_sheet_id: 1, question_id: 4},
  { id: 5, choice: 1, answer_sheet_id: 1, question_id: 5},

  { id: 6, choice: 1, answer_sheet_id: 2, question_id: 1},
  { id: 7, choice: 1, answer_sheet_id: 2, question_id: 2},
  { id: 8, choice: 1, answer_sheet_id: 2, question_id: 3},
  { id: 9, choice: 1, answer_sheet_id: 2, question_id: 4},
  { id: 10, choice: 1, answer_sheet_id: 2, question_id: 5},

  { id: 11, choice: 2, answer_sheet_id: 3, question_id: 1},
  { id: 12, choice: 2, answer_sheet_id: 3, question_id: 2},
  { id: 13, choice: 2, answer_sheet_id: 3, question_id: 3},
  { id: 14, choice: 2, answer_sheet_id: 3, question_id: 4},
  { id: 15, choice: 2, answer_sheet_id: 3, question_id: 5},

  { id: 16, choice: 1, answer_sheet_id: 4, question_id: 1},
  { id: 17, choice: 2, answer_sheet_id: 4, question_id: 2},
  { id: 18, choice: 3, answer_sheet_id: 4, question_id: 3},
  { id: 19, choice: 1, answer_sheet_id: 4, question_id: 4},
  { id: 20, choice: 1, answer_sheet_id: 4, question_id: 5},

  { id: 21, choice: 2, answer_sheet_id: 5, question_id: 1},
  { id: 22, choice: 3, answer_sheet_id: 5, question_id: 2},
  { id: 23, choice: 4, answer_sheet_id: 5, question_id: 3},
  { id: 24, choice: 2, answer_sheet_id: 5, question_id: 4},
  { id: 25, choice: 3, answer_sheet_id: 5, question_id: 5},


  { id: 26, choice: 1, answer_sheet_id: 6, question_id: 6},
  { id: 27, choice: 2, answer_sheet_id: 6, question_id: 7},
  { id: 28, choice: 3, answer_sheet_id: 6, question_id: 8},
  { id: 29, choice: 4, answer_sheet_id: 6, question_id: 9},
  { id: 30, choice: 2, answer_sheet_id: 6, question_id: 10},

  { id: 31, choice: 1, answer_sheet_id: 7, question_id: 6},
  { id: 32, choice: 2, answer_sheet_id: 7, question_id: 7},
  { id: 33, choice: 3, answer_sheet_id: 7, question_id: 8},
  { id: 34, choice: 1, answer_sheet_id: 7, question_id: 9},
  { id: 35, choice: 2, answer_sheet_id: 7, question_id: 10},

  { id: 36, choice: 2, answer_sheet_id: 8, question_id: 6},
  { id: 37, choice: 3, answer_sheet_id: 8, question_id: 7},
  { id: 38, choice: 4, answer_sheet_id: 8, question_id: 8},
  { id: 39, choice: 4, answer_sheet_id: 8, question_id: 9},
  { id: 40, choice: 1, answer_sheet_id: 8, question_id: 10},

  { id: 41, choice: 1, answer_sheet_id: 9, question_id: 6},
  { id: 42, choice: 2, answer_sheet_id: 9, question_id: 7},
  { id: 43, choice: 3, answer_sheet_id: 9, question_id: 8},
  { id: 44, choice: 2, answer_sheet_id: 9, question_id: 9},
  { id: 45, choice: 2, answer_sheet_id: 9, question_id: 10},

  { id: 46, choice: 1, answer_sheet_id: 10, question_id: 6},
  { id: 47, choice: 2, answer_sheet_id: 10, question_id: 7},
  { id: 48, choice: 4, answer_sheet_id: 10, question_id: 8},
  { id: 49, choice: 2, answer_sheet_id: 10, question_id: 9},
  { id: 50, choice: 3, answer_sheet_id: 10, question_id: 10},


  { id: 51, choice: 1, answer_sheet_id: 11, question_id: 11},
  { id: 52, choice: 2, answer_sheet_id: 11, question_id: 12},
  { id: 53, choice: 2, answer_sheet_id: 11, question_id: 13},
  { id: 54, choice: 2, answer_sheet_id: 11, question_id: 14},
  { id: 55, choice: 2, answer_sheet_id: 11, question_id: 15},

  { id: 56, choice: 1, answer_sheet_id: 12, question_id: 11},
  { id: 57, choice: 2, answer_sheet_id: 12, question_id: 12},
  { id: 58, choice: 3, answer_sheet_id: 12, question_id: 13},
  { id: 59, choice: 1, answer_sheet_id: 12, question_id: 14},
  { id: 60, choice: 2, answer_sheet_id: 12, question_id: 15},

  { id: 61, choice: 1, answer_sheet_id: 13, question_id: 11},
  { id: 62, choice: 2, answer_sheet_id: 13, question_id: 12},
  { id: 63, choice: 3, answer_sheet_id: 13, question_id: 13},
  { id: 64, choice: 4, answer_sheet_id: 13, question_id: 14},
  { id: 65, choice: 1, answer_sheet_id: 13, question_id: 15},

  { id: 66, choice: 1, answer_sheet_id: 14, question_id: 11},
  { id: 67, choice: 3, answer_sheet_id: 14, question_id: 12},
  { id: 68, choice: 4, answer_sheet_id: 14, question_id: 13},
  { id: 69, choice: 1, answer_sheet_id: 14, question_id: 14},
  { id: 70, choice: 2, answer_sheet_id: 14, question_id: 15},

  { id: 71, choice: 1, answer_sheet_id: 15, question_id: 11},
  { id: 72, choice: 2, answer_sheet_id: 15, question_id: 12},
  { id: 73, choice: 4, answer_sheet_id: 15, question_id: 13},
  { id: 74, choice: 4, answer_sheet_id: 15, question_id: 14},
  { id: 75, choice: 1, answer_sheet_id: 15, question_id: 15},


  { id: 76, choice: 1, answer_sheet_id: 16, question_id: 16},
  { id: 77, choice: 4, answer_sheet_id: 16, question_id: 17},
  { id: 78, choice: 4, answer_sheet_id: 16, question_id: 18},
  { id: 79, choice: 3, answer_sheet_id: 16, question_id: 19},
  { id: 80, choice: 2, answer_sheet_id: 16, question_id: 20},

  { id: 81, choice: 1, answer_sheet_id: 17, question_id: 16},
  { id: 82, choice: 2, answer_sheet_id: 17, question_id: 17},
  { id: 83, choice: 4, answer_sheet_id: 17, question_id: 18},
  { id: 84, choice: 1, answer_sheet_id: 17, question_id: 19},
  { id: 85, choice: 3, answer_sheet_id: 17, question_id: 20},

  { id: 86, choice: 3, answer_sheet_id: 18, question_id: 16},
  { id: 87, choice: 3, answer_sheet_id: 18, question_id: 17},
  { id: 88, choice: 3, answer_sheet_id: 18, question_id: 18},
  { id: 89, choice: 4, answer_sheet_id: 18, question_id: 19},
  { id: 90, choice: 1, answer_sheet_id: 18, question_id: 20},

  { id: 91, choice: 1, answer_sheet_id: 19, question_id: 16},
  { id: 92, choice: 3, answer_sheet_id: 19, question_id: 17},
  { id: 93, choice: 3, answer_sheet_id: 19, question_id: 18},
  { id: 94, choice: 4, answer_sheet_id: 19, question_id: 19},
  { id: 95, choice: 1, answer_sheet_id: 19, question_id: 20},

  { id: 96, choice: 1, answer_sheet_id: 20, question_id: 16},
  { id: 97, choice: 2, answer_sheet_id: 20, question_id: 17},
  { id: 98, choice: 3, answer_sheet_id: 20, question_id: 18},
  { id: 99, choice: 4, answer_sheet_id: 20, question_id: 19},
  { id: 100, choice: 1, answer_sheet_id: 20, question_id: 20},


  { id: 101, choice: 1, answer_sheet_id: 21, question_id: 21},
  { id: 102, choice: 2, answer_sheet_id: 21, question_id: 22},
  { id: 103, choice: 3, answer_sheet_id: 21, question_id: 23},
  { id: 104, choice: 3, answer_sheet_id: 21, question_id: 24},
  { id: 105, choice: 2, answer_sheet_id: 21, question_id: 25},

  { id: 106, choice: 1, answer_sheet_id: 22, question_id: 21},
  { id: 107, choice: 2, answer_sheet_id: 22, question_id: 22},
  { id: 108, choice: 3, answer_sheet_id: 22, question_id: 23},
  { id: 109, choice: 4, answer_sheet_id: 22, question_id: 24},
  { id: 110, choice: 3, answer_sheet_id: 22, question_id: 25},

  { id: 111, choice: 1, answer_sheet_id: 23, question_id: 21},
  { id: 112, choice: 2, answer_sheet_id: 23, question_id: 22},
  { id: 113, choice: 3, answer_sheet_id: 23, question_id: 23},
  { id: 114, choice: 4, answer_sheet_id: 23, question_id: 24},
  { id: 115, choice: 1, answer_sheet_id: 23, question_id: 25},

  { id: 116, choice: 2, answer_sheet_id: 24, question_id: 21},
  { id: 117, choice: 3, answer_sheet_id: 24, question_id: 22},
  { id: 118, choice: 4, answer_sheet_id: 24, question_id: 23},
  { id: 119, choice: 2, answer_sheet_id: 24, question_id: 24},
  { id: 120, choice: 1, answer_sheet_id: 24, question_id: 25},

  { id: 121, choice: 1, answer_sheet_id: 25, question_id: 21},
  { id: 122, choice: 2, answer_sheet_id: 25, question_id: 22},
  { id: 123, choice: 3, answer_sheet_id: 25, question_id: 23},
  { id: 124, choice: 4, answer_sheet_id: 25, question_id: 24},
  { id: 125, choice: 1, answer_sheet_id: 25, question_id: 25},
)
