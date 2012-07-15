require 'spec_helper'

describe "Items" do

  def current_user
    @auth.user
  end

  context "as user" do

    before(:each) do
      @auth = create(:auth_billy)
      login_with_oauth(@auth)
      @board = create(:board, user: current_user)
    end

    describe "index" do

      it "should list items" do
        my_item = create(:item, url: 'http://item', board: @board)
        other_user_item = create(:item, url: 'Other Item', board: create(:board))
        click_link 'Boards'
        click_link "items_board_#{@board.id}"
        page.should have_content(my_item.url)
        page.should_not have_content(other_user_item.url)
      end

      it "should allow paging" do
        create_list(:item, 30, board: @board)
        click_link 'Boards'
        click_link "items_board_#{@board.id}"
        page.should have_content('Next')
        page.should have_content('Prev')
      end

    end

    describe "create" do

      it "should allow to create" do
        click_link 'Boards'
        click_link "items_board_#{@board.id}"
        click_link 'Add Item'
        fill_in 'Url', with: "http://dev"
        click_on 'Create'
        page.should have_content("Item was successfully created.")
        click_link 'Boards'
        click_link "items_board_#{@board.id}"
        page.should have_content("http://dev")
      end

      it "should allow to create via iframe" do
        visit '/iframe/items/new'
        select @board.name, :from => 'Board'
        fill_in 'Url', with: "http://dev"
        click_on 'Create'
        page.should have_content("Item was successfully created. You may close the popup now.")
      end

    end

    describe "update" do

      it "should allow to update" do
        my_item = create(:item, url: 'http://hello', board: @board)
        click_link 'Boards'
        click_link "items_board_#{@board.id}"
        click_link "edit_item_#{my_item.id}"
        fill_in 'Url', with: "http://new_value"
        click_on 'Update'
        page.should have_content("Item was successfully updated.")
      end

      it "wont allow to update other user item" do
        other_user_item = create(:item, url: 'http://otheruser', board: create(:board))
        visit "/boards/#{other_user_item.board.id}/items/#{other_user_item.id}/edit"
        save_and_open_page
        page.should have_content("You are not authorized to access this page.")
      end

    end

    describe "delete" do

      it "should allow to delete item" do
        my_item = create(:item, url: 'http://hello', board: @board)
        click_link 'Boards'
        click_link "items_board_#{@board.id}"
        click_link "delete_item_#{my_item.id}"
        page.driver.browser.switch_to.alert.accept if Capybara.default_driver == :selenium
        page.should have_content("Item was successfully deleted.")
      end

    end

  end

  context "as admin" do

    before(:each) do
      @auth = create(:auth_grant)
      login_with_oauth(@auth)
      @board = create(:board, user: create(:user))
    end

    describe "create" do

      it "should allow to create in other user board" do
        click_link 'Boards'
        click_link "items_board_#{@board.id}"
        click_link 'Add Item'
        fill_in 'Url', with: "http://dev"
        click_on 'Create'
        page.should have_content("Item was successfully created.")
      end

    end

    describe "update" do

      it "should allow to update other user item" do
        other_user_item = create(:item, url: 'http://otheruser', board: @board)
        click_link 'Boards'
        click_link "items_board_#{@board.id}"
        click_link "edit_item_#{other_user_item.id}"
        fill_in 'Url', with: 'http://thisuser'
        click_on 'Update'
        page.should have_content("Item was successfully updated.")
      end

    end

    describe "delete" do

      it "should allow to delete other user item" do
        other_user_item = create(:item, url: 'http://hello', board: @board)
        click_link 'Boards'
        click_link "items_board_#{@board.id}"
        click_link "delete_item_#{other_user_item.id}"
        page.driver.browser.switch_to.alert.accept if Capybara.default_driver == :selenium
        page.should have_content("Item was successfully deleted.")
      end

    end

  end
end
