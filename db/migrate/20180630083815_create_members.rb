class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :singer_id
      t.string :member_name

      t.timestamps null: false
    end
  end
end
