class CreatePlanets < ActiveRecord::Migration[5.0]
  def change
    create_table :planets do |t|
      t.string :name, null: false
      t.integer :distance_to_sun, null: false
      t.integer :angular_velocity, null: false
      t.timestamps
    end
  end
end
