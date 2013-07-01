# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130701124307) do

  create_table "articles", :force => true do |t|
    t.text     "content",     :null => false
    t.string   "title",       :null => false
    t.text     "description", :null => false
    t.string   "permalink",   :null => false
    t.string   "source"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "articles", ["created_at", "title"], :name => "index_articles_on_created_at_and_title"
  add_index "articles", ["created_at"], :name => "index_articles_on_created_at"

  create_table "articles_categories", :force => true do |t|
    t.integer  "article_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "articles_categories", ["article_id", "category_id"], :name => "index_cat_associations_on_article_id_and_category_id", :unique => true
  add_index "articles_categories", ["article_id"], :name => "index_articles_categories_on_article_id"
  add_index "articles_categories", ["article_id"], :name => "index_cat_associations_on_article_id"
  add_index "articles_categories", ["category_id"], :name => "index_articles_categories_on_category_id"
  add_index "articles_categories", ["category_id"], :name => "index_cat_associations_on_category_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["created_at"], :name => "index_categories_on_created_at"
  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true
  add_index "categories", ["title"], :name => "index_categories_on_title"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

end
