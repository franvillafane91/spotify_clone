class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :listener, null: false, foreign_key: true

      t.timestamps
    end
  end
end
