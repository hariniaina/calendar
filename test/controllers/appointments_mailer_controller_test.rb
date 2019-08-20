require 'test_helper'

class AppointmentsMailerControllerTest < ActionDispatch::IntegrationTest
  test "should get new_app_email" do
    get appointments_mailer_new_app_email_url
    assert_response :success
  end

  test "should get edited_app_email" do
    get appointments_mailer_edited_app_email_url
    assert_response :success
  end

end
