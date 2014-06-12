class AddDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :card_decks do |t|
      t.references :card
      t.references :deck
      t.timestamps
    end
  end
end
