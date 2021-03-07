class CreateUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.timestamps null: false
      t.string :first_name
      t.string :last_name
      t.column :role, :string, null: false
      t.string :email
      t.string :encrypted_password, limit: 128
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128
    end

    add_index :users, :email
    add_index :users, :remember_token
  end

  def down
    drop_table :users
  end
end
