class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.column "code", :string, :null=>false 
      t.column "bunban", :string, :null=>false 
      t.column "title", :string, :null=>false
      t.column "credit", :string, :null=>false
      t.column "day_time", :string 
      t.column "prof", :string 
      t.column "num_of_std", :integer
      t.column "english", :string 
      t.column "abeek", :string 
      t.column "notice", :string 
      t.column "comment", :string
      t.column "year", :int, :null=>false
      t.column "semester", :string, :null=>false
      t.column "dept", :string, :null=>false
    end
    
    #add_index :courses, ["code", "bunban","year","semester"]
    
    #TODO CSV에서 중복되는 데이터 지워야함
    #execute "ALTER TABLE `courses` ADD UNIQUE (`code` ,`bunban` ,`year` ,`semester` ) "
  end

  def self.down
    drop_table :courses
  end
end
