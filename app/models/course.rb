class Course < ActiveRecord::Base
  has_many :surveys
  has_many :qualitative_surveys,
           :order => "created_at DESC"
  has_many :reviews,
           :order => "created_at DESC"

  def semester_name
    name = case semester
             when "SPR" then
               "1학기"
             when "SUM" then
               "여름 계절학기"
             when "FAL" then
               "2학기"
             when "WIN" then
               "겨울 계절학기"
             else
               "학기코드 에러(!)"
           end
    name
  end

  def year_semester
    year.to_s + "년 " + semester_name
  end

  def english?
    (english.nil? or english.blank?) ? '<i class="icon-remove-sign"></i>' : '<i class="icon-ok-sign"></i>'
  end

  def abeek?
    (abeek.nil? or abeek.blank?) ? '<i class="icon-remove-sign"></i>' : '<i class="icon-ok-sign"></i>'
  end

  #TODO 왜 클래스 메소드가 아니면 sanitize_sql을 호출 못하지? sanitize_sql은 protected인데? 알 수 없다.
  def Course.search_condition(cond, keyword)
    segments = []
    segments << sanitize_sql(cond) unless cond.nil?
    segments << sanitize_sql(keyword) unless keyword.nil?
    segments.compact!
    _sql = "(#{segments.join(") AND (")}) " unless segments.empty?
  end

  def count_survey
    @num_of_survey = QualitativeSurvey.count_by_sql("SELECT count( distinct  `course_id`, `created_at`) FROM `qualitative_surveys` where course_id='#{self.id}'")
  end

  def find_related_course
    @related_course= Course.find(:all, :conditions => "prof='#{prof}' and code='#{code}'")
  end
end
