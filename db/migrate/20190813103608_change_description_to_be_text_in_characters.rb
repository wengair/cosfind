class ChangeDescriptionToBeTextInCharacters < ActiveRecord::Migration[5.2]
  def change
      change_column :characters, :description, :text
  end
end
