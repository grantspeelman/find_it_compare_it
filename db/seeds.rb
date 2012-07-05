# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include FactoryGirl::Syntax::Methods
require './spec/support/datamapper_factory_girl'
if Rails.env.development?
  if User.count <= 1
    users = create_list(:user,21)
  else
    users = User.all
  end
  if Board.count <= 1
    100.times { create(:board, user: users.sample) }
  end
end