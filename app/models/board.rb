class Board
  include DataMapper::Resource
  include DataMapper::MassAssignmentSecurity

  property 'id', Serial

  property 'name', String, index: true, unique: :user_id, required: true
  property 'description', Text
  property 'user_id', Integer, :index => true
  property 'test_features_count', Integer, :default => 0
  property 'created_at', DateTime, index: true
  property 'updated_at', DateTime, index: true

  belongs_to :user
  has n, :items
  has 0..30, :test_features, model: 'BoardTestFeature'

  attr_protected :user_id, :test_features_count

  def to_s
    name
  end

end
