class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :answers
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable

  def made_on
  	Faker::Date.between(100.days.ago, Date.today)
  end

  def total_votes
    self.votes.count
  end

  def total_comments
    self.comments.count
  end

  def total_answers
    self.answers.count
  end
end
