class AddDatedServiceJourneys < ActiveRecord::Migration
  def change
    create_table :dated_service_journeys, :force => true do |t|
      t.string   "objectid",                  null: false
      t.integer  "object_version"
      t.datetime "creation_time"
      t.string   "creator_id",                limit: 255
      t.date  "operating_day", :null => false
      t.integer  "vehicle_journey_id", :null => false
      t.string   "service_alteration"
    end
    add_index "dated_service_journeys", ["objectid"], :name => "dated_service_journeys_objectid_key", :unique => true
    add_foreign_key "dated_service_journeys", "vehicle_journeys", name: "vehicle_journeys_fkey"
    add_foreign_key "dated_service_journeys", "dated_service_journeys", column: "derived_from_id", name: "derived_from_fkey"

    create_table :original_dated_service_journeys, :id => false, :force => true do |t|
      t.integer  "original_dated_service_journey_id"
      t.integer  "derived_dated_service_journey_id"
    end
    add_index "original_dated_service_journeys", ["original_dated_service_journey_id", "derived_dated_service_journey_id"], :unique => true, :name => "original_dated_service_journeys_idx"
    add_index "original_dated_service_journeys", ["derived_dated_service_journey_id"], :name => "derived_dated_service_journeys_idx"
    add_foreign_key "original_dated_service_journeys", "dated_service_journeys", column: "original_dated_service_journeys_id", name: "original_dated_service_journeys_id_fkey"
    add_foreign_key "original_dated_service_journeys", "dated_service_journeys", column: "derived_dated_service_journeys_id", name: "derived_dated_service_journeys_id_fkey"

  end
end
