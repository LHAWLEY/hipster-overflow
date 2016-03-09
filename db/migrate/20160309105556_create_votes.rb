class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :votable, { null: false, index: true, polymorphic: true }
      t.references :user, { null: false, index: true }

      t.timestamps(null: false)
    end
  end
end
