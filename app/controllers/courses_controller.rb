class CoursesController < ApplicationController
  before_filter :set_body_css_id
  COURSE_ORDER = "year DESC, semester , code ASC, bunban ASC"

  def index
    @title = "서강대 학부 개설과목 검색"

    @keyword = params[:keyword]
    cond = {}
    if cond.empty?
      cond = "1 = 1"
    end
    keyword_cond = ["title LIKE ? or prof LIKE ? or code LIKE ?", "%#{@keyword}%", "%#{@keyword}%", "%#{@keyword}%"] if not @keyword.nil?
    whole_cond = Course.search_condition cond, keyword_cond

    @pages, @courses = paginate :courses, :conditions => whole_cond, :order => COURSE_ORDER, :per_page => 20
  end

  def show
    begin
      @course = Course.find(params[:id])
      @title = [@course.title, @course.code + "-" + @course.bunban, @course.prof].compact.join(' - ')
      @related_course= @course.find_related_course
    rescue ActiveRecord::RecordNotFound
      logger.error("존재하지 않는 과목에 대한 접근 : #{params[:id]}")
      redirect_to_index("존재하지 않는 과목입니다")
    else
    end
  end

  private

  def set_body_css_id
    @body_css_id = "courses"
  end

  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => :index
  end

end
