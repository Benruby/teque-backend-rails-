
User.destroy_all
User.create( full_name: "name1", email: 'a@a.com', password: "12121212")
User.create( full_name: "name2",email: 'b@b.com', password: "12121212")
User.create( full_name: "name3",email: 'c@c.com', password: "12121212")
User.create( full_name: "name4",email: 'd@d.com', password: "12121212")
User.create( full_name: "name5",email: 'e@e.com', password: "12121212")


Question.destroy_all
Question.create!(title: "question 1 -user 1", body: "This the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the question", user_id: 1)
Question.create!(title: "question 2 -user 1", body: "This the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the question", user_id: 1)
Question.create!(title: "question 7 -user 1", body: "This the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the question", user_id: 1)
Question.create!(title: "question 8 -user 1", body: "This the body of the question, This the body of the question This the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the questionThis the body of the question, This the body of the question", user_id: 1)
Question.create!(title: "question 9 -user 1", body: "This the body of the question, This the body of the question", user_id: 1)
Question.create!(title: "question 3 -user 2", body: "This the body of the question, This the body of the question", user_id: 2)
Question.create!(title: "question 4 -user 2", body: "This the body of the question, This the body of the question", user_id: 2)
Question.create!(title: "question 5 -user 3", body: "This the body of the question, This the body of the question", user_id: 3)
Question.create!(title: "question 6 -user 3", body: "This the body of the question, This the body of the question", user_id: 3)


Answer.destroy_all
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 1 , question_id: 1)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 1 , question_id: 1)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 1 , question_id: 2)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 2 , question_id: 3)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 2 , question_id: 3)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 2 , question_id: 4)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 3 , question_id: 4)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 3 , question_id: 5)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 3 , question_id: 5)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 4 , question_id: 6)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 4 , question_id: 6)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 4 , question_id: 7)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 5 , question_id: 7)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 5 , question_id: 8)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 5 , question_id: 8)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 1 , question_id: 9)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 1 , question_id: 9)
Answer.create!(answer_body: "answer body - some text, answer body - some text, answer body - some text,", user_id: 1 , question_id: 9)