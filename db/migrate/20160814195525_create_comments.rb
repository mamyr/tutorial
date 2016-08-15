class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :micropost_id

      t.timestamps
    end
    add_index :comments, [:user_id, :created_at, :micropost_id]
  end

  def self.down
    drop_table :comments
  end
end
