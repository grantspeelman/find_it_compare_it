class Item
  include DataMapper::Resource

  property 'id', Serial

  property 'url', Text, index: true, unique: :board_id, required: true
  property 'notes', Text

  timestamps :at

  belongs_to :board
end
