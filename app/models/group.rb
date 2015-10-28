class Group < ActiveRecord::Base
	has_many :users, through: :users_groups
end
