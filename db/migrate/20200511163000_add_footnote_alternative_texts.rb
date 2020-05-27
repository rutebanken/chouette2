class AddFootnoteAlternativeTexts < ActiveRecord::Migration
  def change
    create_table :footnote_alternative_texts, :force => true do |t|
      t.string   "objectid",                  null: false
      t.integer  "object_version"
      t.datetime "creation_time"
      t.string   "creator_id",                limit: 255
      t.integer  "footnote_id", :null => false
      t.string   "text", :null => false
      t.string   "language", :null => false
    end
    add_index "footnote_alternative_texts", ["objectid"], :name => "footnote_alternative_texts_objectid_key", :unique => true
    add_index :footnote_alternative_texts, [:footnote_id, :language], :name => "footnote_alternative_texts_footnote_id_language", :unique => true
    add_foreign_key "footnote_alternative_texts", "footnotes", name: "footnotes_footnote_alternative_texts_fkey"

  end
end
