require 'spec_helper'

describe Item do

  context 'validation' do

    it "must have a url" do
      board = Item.new(url: "")
      board.valid?
      board.errors.on(:url).should_not be_nil
    end

    it "must allow more that 50 characters" do
      board = Item.new(url: "a" * 60, board: create(:board))
      board.valid?
      board.errors.on(:url).should be_nil
      board.save.should be_true
    end

  end

end
