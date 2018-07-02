class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :singer
      t.string :album
      t.string :had_card
      t.string :want_card
      t.string :change_type
      t.string :area

      t.timestamps null: false
    end
  end
end
