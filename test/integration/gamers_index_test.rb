require 'test_helper'

class GamersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin     = gamers(:michael)
    @non_admin = gamers(:archer)
  end

  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get gamers_path
    #puts gamers_path
    assert_template 'gamers/index'
  #  assert_select 'div.pagination'
    first_page_of_gamers = Gamer.paginate(page: 1)
    first_page_of_gamers.each do |gamer|
     puts "--->"  + gamer.email #gamer_path(gamer)
      assert_select 'a[href=?]', gamer_path(gamer), text: gamer.username
      unless gamer == @admin
        assert_select 'a[href=?]', gamer_path(gamer), text: 'delete'
     
      end
    end
    assert_difference 'Gamer.count', -1 do
      delete gamer_path(@non_admin)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get gamers_path
    assert_select 'a', text: 'delete', count: 0
  end
end