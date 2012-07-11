class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :user_id
      t.integer :category_id
      t.integer :views

      t.timestamps
    end
    add_index :posts, :user_id
  	add_index :posts, :category_id 
  end

end
