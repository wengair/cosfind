class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :price
      t.string :photo
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
