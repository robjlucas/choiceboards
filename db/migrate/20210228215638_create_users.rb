class CreateUsers < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE user_role AS ENUM ('customer', 'admin');
    SQL

    create_table :users do |t|
      t.timestamps null: false
      t.integer :oldid
      t.string :first_name
      t.string :last_name
      t.column :role, :user_role, null: false
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
    execute <<-SQL
      DROP TYPE user_role;
    SQL
  end
end
