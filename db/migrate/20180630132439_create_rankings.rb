class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.string :singer_member
      t.integer :needcount
      t.timestamps null: false
    end
  end
end
