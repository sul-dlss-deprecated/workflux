require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status" do
    assert_difference('Status.count') do
      post :create, params: { status: { attempts: @status.attempts, datastream: @status.datastream, datetime: @status.datetime, druid: @status.druid + "2", elapsed: @status.elapsed, error_msg: @status.error_msg, error_txt: @status.error_txt, lane_id: @status.lane_id, lifecycle: @status.lifecycle, note: @status.note, priority: @status.priority, process: @status.process, repository: @status.repository, status: @status.status } }
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, params: { id: @status }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @status }
    assert_response :success
  end

  test "should update status" do
    patch :update, params: { id: @status, status: { attempts: @status.attempts, datastream: @status.datastream, datetime: @status.datetime, druid: @status.druid, elapsed: @status.elapsed, error_msg: @status.error_msg, error_txt: @status.error_txt, lane_id: @status.lane_id, lifecycle: @status.lifecycle, note: @status.note, priority: @status.priority, process: @status.process, repository: @status.repository, status: @status.status } }
    assert_redirected_to status_path(assigns(:status))
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, params: { id: @status }
    end

    assert_redirected_to statuses_path
  end
end
