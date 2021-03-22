class MainController < ApplicationController

  before_filter :set_body_css_id

  def index
    @reviews = Review.find(:all, :order => "updated_at DESC, created_at DESC", :limit => 15)
    @num_of_reviews = Review.count

    @surveys = QualitativeSurvey.find_by_sql("SELECT distinct  `course_id`, `created_at` FROM `qualitative_surveys` order by created_at desc limit 15")
    @num_of_survey = QualitativeSurvey.count_by_sql("SELECT count( distinct  `course_id`, `created_at`) FROM `qualitative_surveys`")

  end

  private

  def set_body_css_id
    @body_css_id = "main"
  end

end
