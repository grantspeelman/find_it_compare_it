require 'spec_helper'

describe "Test Features" do

  def current_user
    @auth.user
  end

  context "as user" do

    before(:each) do
      @auth = create(:auth_billy)
      @board = create(:board, user: current_user)
      login_with_oauth(@auth)
    end

    describe "create" do

      it "should allow to create" do
        click_link 'Boards'
        click_link "show_board_#{@board.id}"
        click_link 'Add Test Feature'
        fill_in 'Name', with: "3 doors"
        select 'Must', from: 'Score'
        click_on 'Create'
        page.should have_content("Board test feature was successfully created.")
        page.should have_content("3 doors")
      end

    end

    describe "update" do

      it "should allow to update" do
        my_test_feature = create(:board_test_feature, name: '3 doors', board: @board)
        click_link 'Boards'
        click_link "show_board_#{@board.id}"
        click_link "edit_board_test_feature_#{my_test_feature.id}"
        fill_in 'Name', with: "good kitchen"
        click_on 'Update'
        page.should have_content("Board test feature was successfully updated.")
        page.should have_content("good kitchen")
      end

    end

    describe "delete" do

      it "should allow to delete test_feature" do
        my_test_feature = create(:board_test_feature, name: 'Other', board: @board)
        click_link 'Boards'
        click_link "show_board_#{@board.id}"
        click_link "delete_board_test_feature_#{my_test_feature.id}"
        page.driver.browser.switch_to.alert.accept if Capybara.default_driver == :selenium
        page.should have_content("Board test feature was successfully deleted.")
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
        click_link "show_board_#{@board.id}"
        click_link 'Add Test Feature'
        fill_in 'Name', with: "3 doors"
        select 'Must', from: 'Score'
        click_on 'Create'
        page.should have_content("Board test feature was successfully created.")
        page.should have_content("3 doors")
      end

    end

    describe "update" do

      it "should allow to update" do
        other_user_test_feature = create(:board_test_feature, name: '3 doors', board: @board)
        click_link 'Boards'
        click_link "show_board_#{@board.id}"
        click_link "edit_board_test_feature_#{other_user_test_feature.id}"
        fill_in 'Name', with: "good kitchen"
        click_on 'Update'
        page.should have_content("Board test feature was successfully updated.")
        page.should have_content("good kitchen")
      end

    end

    describe "delete" do

      it "should allow to delete test_feature" do
        other_user_test_feature = create(:board_test_feature, name: 'Other', board: @board)
        click_link 'Boards'
        click_link "show_board_#{@board.id}"
        click_link "delete_board_test_feature_#{other_user_test_feature.id}"
        page.driver.browser.switch_to.alert.accept if Capybara.default_driver == :selenium
        page.should have_content("Board test feature was successfully deleted.")
      end

    end

  end
end
