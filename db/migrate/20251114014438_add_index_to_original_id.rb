class AddIndexToOriginalId < ActiveRecord::Migration[7.2]
  def change
    add_index :bicycle_counters, :original_id, unique: true
  end
end
