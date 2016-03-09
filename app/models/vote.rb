class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :voter, class_name: "User", foreign_key: :user_id
  belongs_to :votable, :polymorphic => true
end
