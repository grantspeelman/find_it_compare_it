require 'spec_helper'

describe BoardTestFeature do

  context 'validation' do

    it "must have a name" do
      board_test_feature = BoardTestFeature.new(name: "")
      board_test_feature.valid?
      board_test_feature.errors.on(:name).should_not be_nil
    end

    it "must have unique names per user" do
      board = create(:board)
      create(:board_test_feature, name: "Test", board: board)
      board.should have(1).test_features
      board_test_feature = BoardTestFeature.new(name: "Test", board: board)
      board_test_feature.should_not be_valid
      board_test_feature.errors.on(:name).should_not be_nil

      board_test_feature = BoardTestFeature.new(name: "Test", board: create(:board))
      board_test_feature.errors.on(:name).should be_nil
    end

    it "must have a score" do
      board_test_feature = BoardTestFeature.new(score: nil)
      board_test_feature.valid?
      board_test_feature.errors.on(:score).should_not be_nil
    end

    it "must not allow more that 30 features per board" do
      board = create(:board)
      create_list(:board_test_feature,30,board: board)
      board.should have(30).test_features
      board.test_features_count.should == 30
      board_test_feature = BoardTestFeature.new(name: "Test", board: board)
      board_test_feature.should_not be_valid
      board.test_features.first.destroy
      board_test_feature.should be_valid
    end

  end
end
