class CreateVotes < ActiveRecord::Migration
  def change
    create_table :up_votes do |t|
      t.references :user, null: false
      t.references :upvotable, polymorphic: true, index: true
      t.boolean :is_upvote
      t.timestamps
    end
  end
end
