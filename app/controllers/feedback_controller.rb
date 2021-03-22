class FeedbackController < ApplicationController
  before_filter :set_body_css_id

  def index
    @title = "피드백"
    @pages, @feedbacks = paginate :feedbacks, :conditions => "1=1", :order => "id desc", :per_page => 10

  end

  def create
    forbidden_word = ["<a href=", "[url=http", "[link=http"]
    for word in forbidden_word
      if params[:feedback]['comment'].include?(word)
        flash[:notice] = "금칙어가 발견되어 등록이 불가능합니다."
        redirect_to :action => 'index'
        return
      end
    end

    @feedback = Feedback.new(params[:feedback])

    if @feedback.save
      flash[:notice] = '피드백이 저장되었습니다'
      redirect_to :action => 'index'
    else
      render :action => 'index'
    end
  end

  private

  def set_body_css_id
    @body_css_id = "feedback"
  end
end
