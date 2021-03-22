class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.column "comment", :text, :null=>false
      t.column "created_at", :datetime, :null=>false
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
