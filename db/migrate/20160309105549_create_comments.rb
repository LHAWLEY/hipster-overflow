class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commentable, { null: false, index: true, polymorphic: true }
      t.references :user, { null: false, index: true }
      t.string :body, { null: false }

      t.timestamps(null: false)
    end
  end
end