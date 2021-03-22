class FeedController < ApplicationController

  session :off
  layout nil

  def feedback
    @feedbacks = Feedback.find(:all, :order => "created_at DESC", :limit => 30)
    headers["Content-Type"] = "application/rss+xml"
  end

  def review
    @reviews = Review.find(:all, :order => "updated_at DESC, created_at DESC", :limit => 30)
    headers["Content-Type"] = "application/rss+xml"
  end

end
