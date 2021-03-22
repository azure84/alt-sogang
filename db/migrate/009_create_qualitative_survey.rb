class CreateQualitativeSurvey < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :qualitative_surveys do |t|
      t.column "course_id", :integer , :null=>false
      t.column "num", :integer , :null=>false
      t.column "answer", :text , :null=>false
      t.column "created_at", :datetime, :null=>false
      t.column "updated_at", :datetime, :null=>false
      #TODO 주관식 설문에도 user_id 넣자
      t.column "user_name", :string, :null=>false
      t.column "hashed_password", :string, :null=>false
      t.column "password_salt", :string, :null=>false
      
  
    end
    foreign_key(:qualitative_surveys, :course_id, :courses)
  end

  def self.down
    drop_table :qualitative_surveys
  end
end
