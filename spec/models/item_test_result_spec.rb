require 'spec_helper'

describe ItemTestResult do

  it "must have a result" do
    item_result = ItemTestResult.new(result: nil)
    item_result.valid?
    item_result.errors.on(:result).should_not be_nil
  end

  it "must set the item score" do
    item  = create(:item)
    test_feature = create(:board_test_feature, score: 10, board: item.board)
    item.score.should == 0
    create(:item_test_result, result: true, board_test_feature: test_feature, item: item)
    item.score.should == 10
    create(:item_test_result, result: true, board_test_feature: test_feature, item: item)
    item.score.should == 20
    test_feature = create(:board_test_feature, score: -5, board: item.board)
    create(:item_test_result, result: true, board_test_feature: test_feature, item: item)
    item.score.should == 15
    create(:item_test_result, result: false, board_test_feature: test_feature, item: item)
    item.score.should == 15
  end

end
