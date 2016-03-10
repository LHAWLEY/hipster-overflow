# author = User.create(username: "Momo", password: "password")
# responder = User.create(username: "Emily", password: "password")
# question = Question.create(title: "Hi", body: "Budyyyyy", author: author)
# answer = Answer.create(body: "My answer", author: responder, question: question)

# question.comments << Comment.new(body: "This is a comment", commentor: responder)
# question.votes << Vote.new(voter: responder)

# 20.times do
# 	num = 0
# 	current_questioner = User.create(username: Faker::Internet.user_name + num.to_s, password: "1")
# 	num += 1
# 	3.times do 
# 		current_question = Question.create(title: Faker::Hipster.sentence, body: Faker::Hipster.paragraph, author: current_questioner)
# 		answers = rand(20)
# 		answers.times do
# 			current_responder = User.create(username: Faker::Internet.user_name + num.to_s, password: "1")
# 			current_answer = Answer.create(body: Faker::Hipster.sentences, author: current_responder, question: current_question)
# 		votes = rand(50)
# 		votes.times do
# 			current_question.votes << Vote.new(voter: User.all.sample)
# 		end
# 		comments = rand(10)
# 		comments.times do
# 			current_question.comments << Comment.new(body: Faker::Hipster.sentences, commentor: User.all.sample)
# 		end
# 		end
# 	end
# end

50.times do
	User.create(username: Faker::Internet.user_name, password: "1")
end

10.times do
	Question.create(title: Faker::Hipster.sentence + "?", body: Faker::Hipster.paragraph, author: User.all.sample)
end

Question.all.each do |question|
	num_answers = rand(1..10)
	num_votes = rand(1..57)
	num_comments = rand(1..5)

	num_answers.times do
		question.answers << Answer.create(body: Faker::Hipster.sentences, author: User.all.sample, question: question)
	end

	num_votes.times do
		question.votes << Vote.new(voter: User.all.sample)
	end

	num_comments.times do
		question.comments << Comment.new(body: Faker::Hipster.sentences, commentor: User.all.sample)
	end
end


