class ItemTestResult
  include DataMapper::Resource
  include DataMapper::MassAssignmentSecurity

  property :id, Serial

  property 'user_id', Integer, index: true, required: true, unique: [:board_test_feature_id,:item_id]
  property 'item_id', Integer, index: true, required: true
  property 'board_test_feature_id', Integer, required: true, index: true
  property 'result', Boolean, index: true, required: true, default: false
  property 'created_at', DateTime, index: true
  property 'updated_at', DateTime, index: true

  after :save, :update_item_score
  after :destroy, :update_item_score

  belongs_to :item
  belongs_to :board_test_feature
  belongs_to :user

  attr_protected :item_id, :board_test_feature_id

  protected

  def update_item_score
    item.score = item.test_results.all(:result => true).inject(0){|s,x|s += x.board_test_feature.score}
    item.save!
  end

end
