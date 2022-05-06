class Users < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index:{ unique: true }
      t.string :password_digest
      t.float :av_highscore
      t.float :av_moves_per_game
      t.float :winrate

      t.timestamps
    end
  end
end
