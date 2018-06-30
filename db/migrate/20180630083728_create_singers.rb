class CreateSingers < ActiveRecord::Migration
  def change
    create_table :singers do |t|
      t.string :singer_name

      t.timestamps null: false
    end
  end
end
