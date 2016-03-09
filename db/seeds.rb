author = User.create(username: "Momo", password: "password")
responder = User.create(username: "Emily", password: "password")
question = Question.create(title: "Hi", body: "Budyyyyy", author: author)
answer = Answer.create(body: "My answer", author: responder, question: question)

question.comments << Comment.new(body: "This is a comment", commentor: responder)
question.votes << Vote.new(voter: responder)
