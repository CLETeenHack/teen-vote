require 'test_helper'

class Admin::IssuesControllerTest < ActionController::TestCase
  setup do
    @admin_issue = admin_issues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_issue" do
    assert_difference('Admin::Issue.count') do
      post :create, admin_issue: { description: @admin_issue.description, issue_type_id: @admin_issue.issue_type_id, title: @admin_issue.title, voting_closed_time: @admin_issue.voting_closed_time, voting_open_time: @admin_issue.voting_open_time }
    end

    assert_redirected_to admin_issue_path(assigns(:admin_issue))
  end

  test "should show admin_issue" do
    get :show, id: @admin_issue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_issue
    assert_response :success
  end

  test "should update admin_issue" do
    patch :update, id: @admin_issue, admin_issue: { description: @admin_issue.description, issue_type_id: @admin_issue.issue_type_id, title: @admin_issue.title, voting_closed_time: @admin_issue.voting_closed_time, voting_open_time: @admin_issue.voting_open_time }
    assert_redirected_to admin_issue_path(assigns(:admin_issue))
  end

  test "should destroy admin_issue" do
    assert_difference('Admin::Issue.count', -1) do
      delete :destroy, id: @admin_issue
    end

    assert_redirected_to admin_issues_path
  end
end
