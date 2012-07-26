class Item
  include DataMapper::Resource
  include DataMapper::MassAssignmentSecurity

  property 'id', Serial

  property 'title', String
  property 'url', Text, required: true, lazy: false
  property 'image_url', Text, lazy: false
  property 'score', Integer, default: 0

  property 'notes', Text

  timestamps :at

  # validates_uniqueness_of :url, :scope => :board_id

  has n, :test_results, model: 'ItemTestResult'
  belongs_to :board

  attr_protected :score
end
