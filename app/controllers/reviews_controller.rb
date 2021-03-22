class ReviewsController < ApplicationController

  layout 'application', :except => [:deledit, :destroy, :authen]
  helper CoursesHelper

  before_filter :set_body_css_id, :get_course_id
  #TODO destroy를 검증할
  verify :method => :post, :only => [:create, :update],
         :redirect_to => {:action => :list, :course_id => @course_id}

  def index
    @title = "그동안 작성된 수강소감 목록"
    @pages, @reviews = paginate :reviews, :order => "updated_at DESC, created_at DESC", :per_page => 30
  end

  def show
    @title = "수강소감"
    unless @course_id.nil?
      @course = Course.find(@course_id)
      @reviews = Review.find_all_by_course_id(@course_id, :order => "id DESC")
      @related_course= @course.find_related_course
    else
      @course_id.nil?
      flash[:notice]="과목 정보가 존재하지 않습니다."
      redirect_to :controller => "main", :action => "index"
    end
  end


  def create
    forbidden_word = ["<a href=", "[url=http", "[link=http"]
    for word in forbidden_word
      if params[:review]["comment"].include?(word)
        flash[:notice] = "금칙어가 발견되어 등록이 불가능합니다."
        redirect_to :action => 'show', :course_id => @course_id
        return
      end
    end

    @review = Review.new(params[:review])

    if @review.save
      flash[:notice] = '수강소감이 등록되었습니다'
      redirect_to :action => 'show', :course_id => @course_id
    else
      show
      render :action => 'show'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    #TODO 리뷰 검색 안될 경우
    #TODO 액션 직접 접근할 경우 - 보안처리 안됨
    if @review.update_attributes(params[:review])
      flash[:notice] = '수강소감이 수정되었습니다.'
      #TODO 리다이렉션 말이 안됨
      redirect_to :action => 'destroy', :course_id => @review.course_id
    else
      render :partial => 'edit'
    end
  end


  def authen
    @id=params[:id]
    @password=params[:review][:password] || ''
    @edit_del_radio=params[:review][:edit_del_review]

    @review=Review.authenticate(@id, @password)
    if @edit_del_radio=='1'
      if @review
        @edit='1'
      else
        flash[:notice]= "비번이 일치하지 않습니다"
        redirect_to(:action => 'deledit', :id => @id)
      end
    elsif @edit_del_radio=='2'
      if @review
        destroy
        render(:action => 'destroy')
      else
        flash[:notice]= "패스워드가 일치하지 않습니다"
        redirect_to(:action => 'deledit', :id => @id)
      end
    end

  end

  def deledit

  end

  private
  #TODO private인데 action이 보임
  def destroy
    #TODO show에서 post로 와야하고, 패스워드 확인 필요함. 검증기에서 실패하면 course_id도 풀린다.
    begin
      Review.find(params[:id]).destroy
      flash[:notice] = '수강소감이 삭제되었습니다.'
    rescue Exception => e
      flash[:notice] = e.message
    end
  end


  def set_body_css_id
    @body_css_id = "courses"
  end

  def get_course_id
    @course_id=params[:course_id] if @course_id.nil?
  end
end

