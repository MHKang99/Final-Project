class AddGameData < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :moves
      t.boolean :win
      t.integer :highscore
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
