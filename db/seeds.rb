# author = User.create(username: "Momo", password: "password")
# responder = User.create(username: "Emily", password: "password")
# question = Question.create(title: "Hi", body: "Budyyyyy", author: author)
# answer = Answer.create(body: "My answer", author: responder, question: question)

# question.comments << Comment.new(body: "This is a comment", commentor: responder)
# question.votes << Vote.new(voter: responder)

20.times do
	current_questioner = User.create(username: Faker::Internet.user_name, password: "1")
	3.times do 
		current_question = Question.create(title: Faker::Hipster.sentence, body: Faker::Hipster.paragraph, author: current_questioner)
		answers = rand(20)
		answers.times do
			current_responder = User.create(username: Faker::Internet.user_name, password: "1")
			current_answer = Answer.create(body: Faker::Hipster.sentences, author: current_responder, question: current_question)
		votes = rand(50)
		votes.times do
			current_question.votes << Vote.new(voter: current_responder)
		end
		end
	end
end
