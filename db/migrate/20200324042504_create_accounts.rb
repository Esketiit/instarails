class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :user_name
      t.string :password_digest


      t.string :email
      t.text :bio
      t.string :first_name
      t.string :last_name


      t.timestamps
    end
    add_index :accounts, :user_name, unique: true
  end
end
