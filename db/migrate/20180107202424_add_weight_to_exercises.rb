class AddWeightToExercises < ActiveRecord::Migration[5.1]
  def change
    add_column :exercises, :weight, :integer
  end
end
