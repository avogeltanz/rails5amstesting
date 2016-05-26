class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments, id: false do |t|
      t.string :id, limit: 36, primary: true
      t.string :body
      t.string :tone
      
      t.timestamps
    end
    add_index :comments, :id, unique: true, using: :btree
  end
end
