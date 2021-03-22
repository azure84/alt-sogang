module CoursesHelper

  def link_to_course(text, id)
    link_to text, {:controller => 'courses', :action => 'show', :id => id}
  end

  def link_to_survey_result(course)
    if course.count_survey == 0
      link_to "<i class=\"icon-pencil\"></i>", :controller => 'survey', :action => 'add', :course_id => course.id
    else
      link_to "<span class=\"badge badge-info\">#{course.count_survey.to_s}</span>", {:controller => "survey", :action => 'show', :course_id => course.id}
    end
  end

  def link_to_review_result(course)
    link_to "<span class=\"badge badge-info\">#{course.reviews.count.to_s}</span>", {:controller => "reviews", :action => 'show', :course_id => course.id}
  end

  def link_to_prof(prof)
    if prof.nil? or prof.blank?
      ""
    else
      link_to prof, :controller => "courses", :action => "index", :keyword => prof
    end
  end


end
