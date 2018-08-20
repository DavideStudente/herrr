require 'test_helper'

class GamersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gamer = gamers(:michael)
    @gamer2= gamers(:archer)
  end

  test "should get index" do
    log_in_as(@gamer)  #aggiunto
    get gamers_url
    assert_response :success
  end

  test "should get new" do
    get new_gamer_url
    assert_response :success
  end



  test "should create gamer" do    #????????????? perche non crea nuovo utente?
    assert_difference('Gamer.count') do
      post gamers_path, params: { gamer: { username:  "Example User",
                                         email: "user1@example.com",
                                         password:              "password",
                                         password_confirmation: "password"} }
    end

    assert_redirected_to gamer_url(Gamer.last)
  end

  test "should show gamer" do
    get gamer_url(@gamer)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@gamer)   #aggiunto
    get edit_gamer_url(@gamer)
    assert_response :success
  end

  #test "should update gamer" do
  #  log_in_as(@gamer)    #aggiunto
  #  patch gamer_url(@gamer), params: { gamer: { email: @gamer.email, username: @gamer.username } }
  #  assert_redirected_to gamer_url(@gamer)
  #end

  test "should destroy gamer" do
    assert_difference('Gamer.count', -1) do
      delete gamer_url(@gamer)
    end


  test "should redirect destroy when not logged in" do
    assert_no_difference 'Gamer.count' do
      delete user_path(@gamer)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@gamer2)
    assert_no_difference 'Gamer.count' do
      delete user_path(@gamer)
    end
    assert_redirected_to root_url
  end
end
