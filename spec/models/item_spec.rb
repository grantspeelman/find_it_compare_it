require 'spec_helper'

describe Item do

  context 'validation' do

    it "must have a url" do
      board = Item.new(url: "")
      board.valid?
      board.errors.on(:url).should_not be_nil
    end

    it "must have unique url per board" do
      board = create(:board)
      create(:item, url: "http://test", board: board)
      board.should have(1).item
      item = Item.new(url: "http://test", board: board)
      item.should_not be_valid
      item.errors.on(:url).should_not be_nil

      item = Item.new(url: "http://test", board: create(:board))
      item.errors.on(:url).should be_nil
    end

  end

end