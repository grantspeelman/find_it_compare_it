class User
  include DataMapper::Resource
  include DataMapper::MassAssignmentSecurity

  property 'id',        Serial
  property 'name',      String, required: true
  property 'role',      String, required: true, default: 'normal_user'
  property 'time_zone', String
  property 'created_at', DateTime, index: true
  property 'updated_at', DateTime, index: true

  has n, :authorizations
  has n, :boards

  attr_protected :role

  def authorized_with(provider)
    self.authorizations.all(provider: provider.to_s).count > 0
  end

  def to_s
    name
  end

end

