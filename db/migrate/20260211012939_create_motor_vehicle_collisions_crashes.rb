class CreateMotorVehicleCollisionsCrashes < ActiveRecord::Migration[7.2]
  def change
    create_table :motor_vehicle_collisions_crashes do |t|
      t.datetime :crash_date
      t.datetime :crash_time
      t.string :borough
      t.string :zip_code
      t.decimal :latitude
      t.decimal :longitude
      t.jsonb :location
      t.string :on_street_name
      t.string :off_street_name
      t.string :cross_street_name
      t.integer :number_of_persons_injured
      t.integer :number_of_persons_killed
      t.integer :number_of_pedestrians_injured
      t.integer :number_of_pedestrians_killed
      t.integer :number_of_cyclist_injured
      t.integer :number_of_cyclist_killed
      t.integer :number_of_motorist_injured
      t.integer :number_of_motorist_killed
      t.string :contributing_factor_vehicle_1
      t.string :contributing_factor_vehicle_2
      t.string :contributing_factor_vehicle_3
      t.string :contributing_factor_vehicle_4
      t.string :contributing_factor_vehicle_5
      t.bigint :collision_id
      t.string :vehicle_type_code1
      t.string :vehicle_type_code2
      t.string :vehicle_type_code_3
      t.string :vehicle_type_code_4
      t.string :vehicle_type_code_5

      t.timestamps
    end

    add_index :motor_vehicle_collisions_crashes, :collision_id, unique: true
  end
end
