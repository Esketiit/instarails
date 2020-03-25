class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.belongs_to :account, null: false, foreign_key: true
      t.text :description
      t.string :image
      t.timestamps
    end
  end
end
