require 'active_record/fixtures'

class LoadCoursesData < ActiveRecord::Migration
  def self.up
    directory = File.join(File.dirname(__FILE__), "course_data")
    Fixtures.create_fixtures(directory, "courses")
  end

  def self.down
    Course.delete_all
  end
end
