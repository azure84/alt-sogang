class SurveyController < ApplicationController
  layout 'application'
  helper CoursesHelper
  before_filter :set_body_css_id, :get_course_id


  def add
    @title = "주관식 강의평가 등록"
    @course = Course.find(params[:course_id])
  end


  def create
    if @course_id.nil?
      flash[:notice] = "과목이 지정되지 않았습니다."
      redirect_to :controller => "courses", :action => "index"
      return
    end
    for i in 1..8
      ans = params[:qualitative_survey]["qualitative"+i.to_s]

      forbidden_word = ["<a href=", "[url=http", "[link=http"]
      for word in forbidden_word
        if ans.include?(word)
          flash[:notice] = "금칙어가 발견되어 등록이 불가능합니다."
          redirect_to :controller => "courses", :action => "index"
          return
        end
      end

      unless ans.blank?
        q = QualitativeSurvey.new
        q.course_id = @course_id
        q.num = i
        q.answer = ans
        if q.save

        else
          redirect_to :action => 'add', :course_id => @course_id
          return
        end
      end
    end
    flash[:notice] = "모두 저장 되었습니다"
    redirect_to :controller => 'courses', :action => 'show', :id => @course_id

  end


  def show
    @title = "주관식 강의평가 결과"
    @course = Course.find(@course_id)
    @related_course= @course.find_related_course

    @q = Array.new
    for i in 1..8
      @q[i] = QualitativeSurvey.find_all_by_course_id_and_num(@course_id, i, :order => "id DESC")
    end
  end

  def index
    @title = "그동안 작성된 주관식 강의평가 목록"
    @surveys = QualitativeSurvey.find_by_sql("SELECT distinct  `course_id`, `created_at` FROM `qualitative_surveys` order by created_at desc")
    @pages, @surveys = paginate @surveys, :per_page => 30
  end

  private


  def set_body_css_id
    @body_css_id = "courses"
  end

  def get_course_id
    @course_id = params[:course_id]
  end
end