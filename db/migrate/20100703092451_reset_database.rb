class ResetDatabase < ActiveRecord::Migration
  def self.up
    create_table "keywordings", :force => true do |t|
      t.integer  "post_id",    :null => false
      t.integer  "keyword_id", :null => false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "keywords", :force => true do |t|
      t.string   "name",       :null => false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "posts", :force => true do |t|
      t.string   "topic",        :null => false
      t.text     "body",         :null => false
      t.datetime "published_at"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table "keywordings"
    drop_table "keywords"
    drop_table "posts"
  end
end
