class Authorization
  include DataMapper::Resource

  property 'id',        Serial
  property 'uid',       String,  :required => true, :unique => :provider, :index => true
  property 'provider',  String,  :required => true, :index => true
  property 'user_id',  Integer, :index => true
  property 'auth_hash', Object
  property 'created_at', DateTime, index: true
  property 'updated_at', DateTime, index: true

  belongs_to :user

  validates_uniqueness_of :uid, :scope => :provider

  after :destroy, :destroy_user_if_last_authorization

  def self.find_from_hash(hash)
    first(:uid => hash[:uid], :provider => hash[:provider])
  end

  def self.create_from_hash(hash, user = nil)
    user ||= User.create(:name => hash[:name])
    if User.count(:role => 'admin') == 0
      user.role = 'admin'
      user.save
    end
    Authorization.create(:user => user, :uid => hash[:uid], :provider => hash[:provider])
  end

  protected

  def destroy_user_if_last_authorization
    user.destroy if user && user.authorizations.empty?
  end

end