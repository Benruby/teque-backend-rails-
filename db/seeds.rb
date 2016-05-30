
User.destroy_all
User.create( email: 'a@a.com', password: "12121212")
User.create( email: 'b@b.com', password: "12121212")
User.create( email: 'c@c.com', password: "12121212")
User.create( email: 'd@d.com', password: "12121212")
User.create( email: 'e@e.com', password: "12121212")


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


