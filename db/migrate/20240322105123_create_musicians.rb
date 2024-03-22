class CreateMusicians < ActiveRecord::Migration[7.1]
  def change
    create_table :musicians do |t|
      t.string :name_first
      t.string :name_last
      t.string :name_scene
      t.date :birth_date

      t.timestamps
    end
  end
end
