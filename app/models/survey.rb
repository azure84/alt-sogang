class Survey < ActiveRecord::Base
  belongs_to :courses
  validates_presence_of :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :course_id, :message => "보기를 선택해야 합니다."

  def course
    Course.find(course_id)
  end


end