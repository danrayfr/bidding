class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :lowest_bid
      t.integer :starting_bid
      t.datetime :bidding_expiration
      t.boolean :is_active
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
