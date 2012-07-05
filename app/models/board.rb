class Board
  include DataMapper::Resource
  include DataMapper::MassAssignmentSecurity

  property 'id', Serial

  property 'name', String, index: true, unique: true, required: true
  property 'description', Text
  timestamps :at

  belongs_to :user
  has n, :items

  attr_protected :user_id
end
