class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :password_digest
      t.string :email
      t.text :bio

      t.timestamps
    end
  end
end
