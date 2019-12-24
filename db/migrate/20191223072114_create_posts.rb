class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.string :image
      t.boolean :status
      t.datetime :published_date
      t.integer :user_id
      t.timestamps
    end
  end
end
