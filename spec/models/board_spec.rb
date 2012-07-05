require 'spec_helper'

describe Board do

  context 'validation' do

    it "must have a name" do
      board = Board.new(name: "")
      board.valid?
      board.errors.on(:name).should_not be_nil
    end

    it "must have unique names per user" do
      user = create(:user)
      create(:board, name: "Test", user: user)
      user.should have(1).boards
      board = Board.new(name: "Test", user: user)
      board.should_not be_valid
      board.errors.on(:name).should_not be_nil

      board = Board.new(name: "Test", user: create(:user))
      board.errors.on(:name).should be_nil
    end

  end

end
