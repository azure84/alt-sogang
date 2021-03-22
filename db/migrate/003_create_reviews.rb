require "migration_helpers"

class CreateReviews < ActiveRecord::Migration
  extend MigrationHelpers

  def self.up
    create_table :reviews do |t|
      t.column :user , :string, :null=>false, :limit=>20
      t.column :hashed_pw , :string, :null=>false
      t.column :salt , :string, :null=>false
      t.column :comment, :text, :null=>false
      t.column :course_id, :integer, :null=>false
      t.column :parent_id, :integer
      t.column :created_at, :datetime, :null=>false
      t.column :updated_at, :datetime, :null=>false
    end
    foreign_key(:reviews, :course_id, :courses)
  end

  def self.down
    drop_table :reviews
  end
end
