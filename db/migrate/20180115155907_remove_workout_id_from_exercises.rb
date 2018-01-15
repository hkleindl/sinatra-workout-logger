class RemoveWorkoutIdFromExercises < ActiveRecord::Migration[5.1]
  def change
    remove_column :exercises, :workout_id
  end
end
