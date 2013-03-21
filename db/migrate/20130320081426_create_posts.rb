class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :state
      t.string :slug
      t.timestamp :published_at

      t.timestamps
    end
  end
end
