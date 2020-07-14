module HomeHelper
  def answer_check(exam)
    answer_sheet = AnswerSheet.find_by(exam_id: exam.id, user_id: current_user)
  end
end
