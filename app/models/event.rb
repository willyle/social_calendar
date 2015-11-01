class Event < ActiveRecord::Base
	validates :title,
				 uniqueness: true,
				 presence: true

	validates :address_1,
				 presence: true

	validates :city,
				 presence: true

	validates :state,
				 presence: true

	validates :date,
				 presence: true

	validates :creator_id,
				 presence: true
				 
	has_many :attendances			 
	has_many :users, through: :attendances
end
