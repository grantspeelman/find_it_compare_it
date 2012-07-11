require 'spec_helper'

describe 'Home' do

  def current_user
    @auth.user
  end


  describe "first login" do

    it "should see home page" do
      visit "/auth/google"
      page.should have_content("Home")
    end

  end

  context "as user" do

    before(:each) do
      @auth = create(:auth_billy)
      login_with_oauth(@auth)
    end

    it "should allow you to create boards from home page" do
      visit '/'
      page.should have_link("New Board")
      click_link 'New Board'
      current_path.should == '/boards/new'
    end

  end

end
