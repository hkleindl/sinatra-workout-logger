class AddDescriptionToExercises < ActiveRecord::Migration[5.1]
  def change
    add_column :exercises, :description, :text
  end
end
