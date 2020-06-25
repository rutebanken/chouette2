class AddDatedServiceJourneys < ActiveRecord::Migration
  def change
    create_table :dated_service_journeys, :force => true do |t|
      t.string   "objectid",                  null: false
      t.integer  "object_version"
      t.datetime "creation_time"
      t.string   "creator_id",                limit: 255
      t.date  "operating_day", :null => false
      t.integer  "vehicle_journey_id", :null => false
      t.integer  "derived_from_id"
      t.string   "service_alteration"
    end
    add_index "dated_service_journeys", ["objectid"], :name => "dated_service_journeys_objectid_key", :unique => true
    add_foreign_key "dated_service_journeys", "vehicle_journeys", name: "vehicle_journeys_fkey"
    add_foreign_key "dated_service_journeys", "dated_service_journeys", column: "derived_from_id", name: "derived_from_fkey"

  end
end
