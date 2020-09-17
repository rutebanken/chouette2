class AddBlocks < ActiveRecord::Migration
  def change
    create_table :blocks, :force => true do |t|
      t.string   "objectid",                  null: false
      t.integer  "object_version"
      t.datetime "creation_time"
      t.string   "creator_id",                limit: 255
      t.string   "private_code"
    end
    add_index "blocks", ["objectid"], :name => "blocks_objectid_key", :unique => true

    create_table :blocks_vehicle_journeys, :id => false, :force => true do |t|
      t.integer  "block_id"
      t.integer  "vehicle_journey_id"
    end
    add_index "blocks_vehicle_journeys", ["block_id", "vehicle_journey_id"], :unique => true,
              :name => "blocks_vehicle_journeys_block_id_vehicle_journey_id_key"
    add_index "blocks_vehicle_journeys", ["vehicle_journey_id"], :name => "blocks_vehicle_journeys_vehicle_journey_id_idx"
    add_foreign_key "blocks_vehicle_journeys", "blocks", column: "block_id",  name: "blocks_vehicle_journeys_block_id_fkey"
    add_foreign_key "blocks_vehicle_journeys", "vehicle_journeys", column: "vehicle_journey_id",  name: "blocks_vehicle_journeys_vehicle_journey_id_fkey"

    create_table :blocks_day_types, :id => false, :force => true do |t|
      t.integer  "block_id"
      t.integer  "day_type_id"
    end
    add_index "blocks_day_types", ["block_id", "day_type_id"], :unique => true,
              :name => "blocks_day_types_block_id_day_type_id_key"
    add_index "blocks_day_types", ["day_type_id"], :name => "blocks_day_types_day_type_id_idx"
    add_foreign_key "blocks_day_types", "blocks", column: "block_id",  name: "blocks_day_types_block_id_fkey"
    add_foreign_key "blocks_day_types", "vehicle_journeys", column: "day_type_id",  name: "blocks_day_types_day_type_id_fkey"

  end
end
