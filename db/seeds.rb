# author = User.create(username: Faker::Hipster.word, password: "password")
# responder = User.create(username: Faker::Hipster.word, password: "password")
# question = Question.create(title: Faker::Hipster.word, body: Faker::Hipster.sentences, author: author)
# answer = Answer.create(body: Faker::Hipster.sentences, author: responder, question: question)

# question.comments << Comment.new(body: Faker::Hipster.sentences, commentor: responder)
# question.votes << Vote.new(voter: responder)

# 5.times do
#   user = User.create(username: Faker::Internet.user_name, password: "password")
#   5.times do
#     question = user.questions.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user_id: 2)
#     5.times do
#       question.answers.create(body: Faker::Lorem.sentence, user_id: 3)
#     end
#   end
# end
