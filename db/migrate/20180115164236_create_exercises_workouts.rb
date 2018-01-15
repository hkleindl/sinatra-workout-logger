class CreateExercisesWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :exerises_workouts do |t|
      t.integer :exercise_id
      t.integer :workout_id
    end
  end
end
