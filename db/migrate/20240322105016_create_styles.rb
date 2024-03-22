class CreateStyles < ActiveRecord::Migration[7.1]
  def change
    create_table :styles do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
