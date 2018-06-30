class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :singer
      t.string :album
      t.string :had_card
      t.string :want_card
      t.string :change_type
      t.string :kakao_id
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
