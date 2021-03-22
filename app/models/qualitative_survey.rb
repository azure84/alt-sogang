class QualitativeSurvey < ActiveRecord::Base
  belongs_to :courses

  def course
    Course.find(course_id)
  end
end


##유저 이름과 작성일자와 글의 id를 알 수 있는 칼럼 필요