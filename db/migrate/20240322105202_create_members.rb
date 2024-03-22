class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :musician, null: false, foreign_key: true
      t.date :date_of_activity

      t.timestamps
    end
  end
end
