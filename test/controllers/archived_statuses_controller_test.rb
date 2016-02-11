require 'test_helper'

class ArchivedStatusesControllerTest < ActionController::TestCase
  setup do
    @archived_status = archived_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:archived_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create archived_status" do
    assert_difference('ArchivedStatus.count') do
      post :create, archived_status: { archive_dt: @archived_status.archive_dt, attempts: @archived_status.attempts, datastream: @archived_status.datastream, datetime: @archived_status.datetime, druid: @archived_status.druid, elapsed: @archived_status.elapsed, error_msg: @archived_status.error_msg, error_txt: @archived_status.error_txt, lane_id: @archived_status.lane_id, lifecycle: @archived_status.lifecycle, note: @archived_status.note, priority: @archived_status.priority, process: @archived_status.process, repository: @archived_status.repository, status: @archived_status.status, version: @archived_status.version }
    end

    assert_redirected_to archived_status_path(assigns(:archived_status))
  end

  test "should show archived_status" do
    get :show, id: @archived_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @archived_status
    assert_response :success
  end

  test "should update archived_status" do
    patch :update, id: @archived_status, archived_status: { archive_dt: @archived_status.archive_dt, attempts: @archived_status.attempts, datastream: @archived_status.datastream, datetime: @archived_status.datetime, druid: @archived_status.druid, elapsed: @archived_status.elapsed, error_msg: @archived_status.error_msg, error_txt: @archived_status.error_txt, lane_id: @archived_status.lane_id, lifecycle: @archived_status.lifecycle, note: @archived_status.note, priority: @archived_status.priority, process: @archived_status.process, repository: @archived_status.repository, status: @archived_status.status, version: @archived_status.version }
    assert_redirected_to archived_status_path(assigns(:archived_status))
  end

  test "should destroy archived_status" do
    assert_difference('ArchivedStatus.count', -1) do
      delete :destroy, id: @archived_status
    end

    assert_redirected_to archived_statuses_path
  end
end
