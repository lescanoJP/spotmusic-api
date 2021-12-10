class CreateRecentlyHeards < ActiveRecord::Migration[6.0]
  def change
    create_table :recently_heards do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :album, null: false, foreign_key: true

      t.timestamps
    end
  end
end
