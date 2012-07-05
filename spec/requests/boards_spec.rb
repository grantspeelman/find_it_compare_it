require 'spec_helper'

describe "Boards" do

  def current_user
    @auth.user
  end

  context "as user" do

    before(:each) do
      @auth = create(:auth_billy)
      login_with_oauth(@auth)
    end

    describe "index" do

      it "should list boards" do
        my_board = create(:board,name: 'My Board', user: current_user)
        my_board.user_id.should == current_user.id
        other_user_board = create(:board, name: 'Other Board', user: create(:user))
        click_link 'Boards'
        page.should have_content(my_board.name)
        page.should_not have_content(other_user_board.name)
      end

      it "should allow paging" do
        create_list(:board,30, user: current_user)
        click_link 'Boards'
        page.should have_content('Next')
        page.should have_content('Prev')
      end

    end

    describe "create" do

      it "should allow to create" do
        click_link 'Boards'
        click_link 'Add Board'
        fill_in 'Name', with: "My new Board"
        click_on 'Create'
        page.should have_content("Board was successfully created.")
      end

    end

    describe "update" do

      it "should allow to update" do
        my_board = create(:board,name: 'My Board', user: current_user)
        click_link 'Boards'
        click_link "edit_board_#{my_board.id}"
        fill_in 'Name', with: "My new name"
        click_on 'Update'
        page.should have_content("Board was successfully updated.")
      end

      it "wont allow to update other user board" do
        other_user_board = create(:board,name: 'Not My Board', user: create(:user))
        visit "/boards/#{other_user_board.id}/edit"
        page.should have_content("You are not authorized to access this page.")
      end

    end

    describe "delete" do

      it "should allow to delete board" do
        my_board = create(:board, name: 'My Board', user: current_user)
        click_link 'Boards'
        click_link "delete_board_#{my_board.id}"
        page.driver.browser.switch_to.alert.accept if Capybara.default_driver == :selenium
        page.should have_content("Board was successfully deleted.")
      end

    end

  end

  context "as admin" do

    before(:each) do
      @auth = create(:auth_grant)
      login_with_oauth(@auth)
    end

    describe "index" do

      it "should list all boards" do
        my_board = create(:board,name: 'My Board', user: current_user)
        other_user_board = create(:board, name: 'Other Board', user: create(:user))
        visit '/boards'
        page.should have_content(my_board.name)
        page.should have_content(other_user_board.name)
      end

    end

    describe "update" do

      it "should allow to update other user board" do
        other_user_board = create(:board,name: 'Not My Board', user: create(:user))
        visit '/boards'
        click_link "edit_board_#{other_user_board.id}"
        fill_in 'Name', with: "My new name"
        click_on 'Update'
        page.should have_content("Board was successfully updated.")
      end

    end

  end
end
