class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :commentable, :polymorphic => true
  belongs_to :commentor, class_name: "User", foreign_key: :user_id
end
