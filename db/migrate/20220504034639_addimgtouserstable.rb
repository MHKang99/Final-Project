class Addimgtouserstable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :img, :text
  end
end
