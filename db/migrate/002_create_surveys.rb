require "migration_helpers"

class CreateSurveys < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :surveys do |t|
      t.column "course_id", :integer , :null=>false
      t.column "user_id", :integer, :null=>true
      t.column "q1", :integer , :null=>false
      t.column "q2", :integer , :null=>false 
      t.column "q3", :integer , :null=>false
      t.column "q4", :integer , :null=>false
      t.column "q5", :integer , :null=>false
      t.column "q6", :integer , :null=>false
      t.column "q7", :integer , :null=>false
      t.column "q8", :integer , :null=>false
      t.column "created_at", :datetime, :null=>false 
    end
    
    foreign_key(:surveys, :course_id, :courses)
  end

  def self.down
    drop_table :surveys
  end
end
