author = User.create(username: "Momo", hashed_password: "password")
responder = User.create(username: "Emily", hashed_password: "password")
question = Question.create(title: "Hi", body: "Budyyyyy", user: author)
answer = Answer.create(body: "My answer", author: responder, question: question)

Comment.create(body: "This is a comment", commentor: responder)
Vote.create(user_id: user2.id, votable_id: question.id, votable_type: "question_id")
