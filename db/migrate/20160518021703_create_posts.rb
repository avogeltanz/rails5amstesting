class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts, id: false do |t|
      t.string :id, limit: 36, primary: true
      t.string :title
      t.string :description

      t.timestamps
    end
    add_index :posts, :id, unique: true, using: :btree
  end
end
