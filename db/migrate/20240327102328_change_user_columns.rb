class ChangeUserColumns < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :provider, :string, limit: 50, default: "", null: false
    add_column :users, :uid, :string, limit: 50, default: "", null: false
  end
end
