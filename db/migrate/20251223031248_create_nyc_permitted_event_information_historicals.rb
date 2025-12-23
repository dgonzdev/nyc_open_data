class CreateNycPermittedEventInformationHistoricals < ActiveRecord::Migration[7.2]
  def change
    create_table :nyc_permitted_event_information_historicals do |t|
      t.integer :event_id
      t.string :event_name
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.string :event_agency
      t.string :event_type
      t.string :event_borough
      t.string :event_location
      t.string :event_street_side
      t.string :street_closure_type
      t.string :community_board
      t.string :police_precinct

      t.timestamps
    end

    add_index :nyc_permitted_event_information_historicals, [:event_id, :start_date_time, :end_date_time], unique: true
  end
end
