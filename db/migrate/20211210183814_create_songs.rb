class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :played_count, default: 0
      t.belongs_to :album, null: false, foreign_key: true

      t.timestamps
    end
  end
end
