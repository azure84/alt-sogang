require File.dirname(__FILE__) + '/../test_helper'
require 'timetable_controller'

# Re-raise errors caught by the controller.
class TimetableController; def rescue_action(e) raise e end; end

class TimetableControllerTest < Test::Unit::TestCase
  def setup
    @controller = TimetableController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
