class CreateForecasts < ActiveRecord::Migration[5.0]
  def change
    create_table :forecasts do |t|
      t.integer :day, null: false
      t.string :forecast, null: false
      t.integer :precipitation, null: false, default: 0
      t.timestamps
    end
  end
end
