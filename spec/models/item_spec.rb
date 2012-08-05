require 'spec_helper'

describe Item do

  context 'validation' do

    it "must have a title" do
      item = build(:item,title: "")
      item.valid?
      item.errors.on(:title).should_not be_nil
    end

    it "must have a url" do
      item = build(:item,url: "")
      item.valid?
      item.errors.on(:url).should_not be_nil
    end

    it "must allow more that 50 characters" do
      item = build(:item,url: "a" * 60, board: create(:board))
      item.valid?
      item.errors.on(:url).should be_nil
      item.save.should be_true
    end

  end

end
