class Item
  include DataMapper::Resource

  property 'id', Serial

  property 'url', Text, required: true
  property 'image_url', Text

  property 'notes', Text

  timestamps :at

  validates_uniqueness_of :url, :scope => :board_id

  belongs_to :board
end
