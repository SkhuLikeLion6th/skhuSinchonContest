class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :area
      t.integer :changetype_id

      t.timestamps null: false
    end
  end
end
