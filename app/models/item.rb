class Item
  include DataMapper::Resource

  property 'id', Serial

  property 'title', String
  property 'url', Text, required: true, lazy: false
  property 'image_url', Text, lazy: false

  property 'notes', Text

  timestamps :at

  # validates_uniqueness_of :url, :scope => :board_id

  belongs_to :board
end
