class CreateUpVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, null: false
      t.references :votable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
