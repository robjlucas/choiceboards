class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :image_uid
      t.string :sound_uid

      t.timestamps
    end
  end
end
