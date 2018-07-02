class CreateChangetypes < ActiveRecord::Migration
  def change
    create_table :changetypes do |t|
      t.string :change

      t.timestamps null: false
    end
  end
end
