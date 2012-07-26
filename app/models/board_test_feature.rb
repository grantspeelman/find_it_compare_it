class BoardTestFeature
  include DataMapper::Resource
  include DataMapper::MassAssignmentSecurity

  property :id, Serial

  property 'name', String, required: true, unique: :board_id
  property 'score', Integer, :default => 10, required: true
  property 'board_id', Integer, :index => true
  timestamps :at

  validates_with_method :check_feature_count

  validates_numericality_of 'score', :only_integer => true

  belongs_to :board

  attr_protected :board_id

  after :create, :update_board_test_feature_count
  after :destroy, :update_board_test_feature_count

  protected

  def check_feature_count
    if new? && board && board.test_features_count >= 30
      [ false, "You can't have more than 30 test features per board" ]
    else
      true
    end
  end

  def update_board_test_feature_count
    board.test_features_count = board.test_features.count
    board.save!
  end

end
