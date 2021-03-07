class CreateChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :choices do |t|
      t.references :choiceboard, null: false, foreign_key: true
      t.integer :chooseable_id
      t.string :chooseable_type

      t.timestamps
    end
  end
end
