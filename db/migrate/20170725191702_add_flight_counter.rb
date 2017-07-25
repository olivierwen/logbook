class AddFlightCounter < ActiveRecord::Migration[5.1]
  def change
    add_column :pilots, :flights_count, :integer, null: false, default: 0

    if Rails.env.development?
      Pilot.pluck(:id).each do |pilot_id|
        Pilot.reset_counters(pilot_id, :flights)
      end
    end
  end
end
