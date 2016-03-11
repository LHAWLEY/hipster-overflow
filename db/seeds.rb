50.times do
	User.create(username: Faker::Internet.user_name, password: "1", profile_pic: Faker::Avatar.image)
end

10.times do
	Question.create(title: Faker::Hipster.words(6).join(" ") + "?", body: Faker::Hipster.paragraph, author: User.all.sample)
end

Question.all.each do |question|
	num_answers = rand(1..10)
	num_votes = rand(1..57)
	num_comments = rand(1..5)

	num_answers.times do
		question.answers << Answer.create(body: Faker::Hipster.sentence, author: User.all.sample, question: question)
	end

	num_votes.times do
		question.votes << Vote.new(voter: User.all.sample)
	end

	num_comments.times do
		question.comments << Comment.new(body: Faker::Hipster.sentence, commentor: User.all.sample)
	end
end


