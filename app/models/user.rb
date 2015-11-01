class User < ActiveRecord::Base
	validates :username,
				 uniqueness: true

	validates :password,
				 length: { minimum: 6}

	has_one :profile
	has_many :attendances
	has_many :events, through: :attendances
	has_many :groups, through: :users_groups
	has_and_belongs_to_many :users,
		:join_table => :follows,
		:foreign_key => "follower_id",
		:association_foreign_key => "followee_id"
end
