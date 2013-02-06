require 'test_helper'

class TypeRoomsControllerTest < ActionController::TestCase
  setup do
    @type_room = type_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_room" do
    assert_difference('TypeRoom.count') do
      post :create, type_room: { name: @type_room.name }
    end

    assert_redirected_to type_room_path(assigns(:type_room))
  end

  test "should show type_room" do
    get :show, id: @type_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_room
    assert_response :success
  end

  test "should update type_room" do
    put :update, id: @type_room, type_room: { name: @type_room.name }
    assert_redirected_to type_room_path(assigns(:type_room))
  end

  test "should destroy type_room" do
    assert_difference('TypeRoom.count', -1) do
      delete :destroy, id: @type_room
    end

    assert_redirected_to type_rooms_path
  end
end
