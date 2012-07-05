class Item
  include DataMapper::Resource
  include DataMapper::MassAssignmentSecurity

  property 'id', Serial

  property 'url', String, index: true, unique: true, required: true
  property 'notes', Text

  timestamps :at

  belongs_to :board
  attr_protected :item_id
end
