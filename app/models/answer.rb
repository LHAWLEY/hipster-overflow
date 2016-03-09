class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable
end
