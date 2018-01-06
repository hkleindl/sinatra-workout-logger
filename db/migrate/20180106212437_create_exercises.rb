class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :type
      t.string :name
      t.integer :reps
      t.integer :sets
      t.string :intensity
      t.integer :minutes
    end
  end
end
