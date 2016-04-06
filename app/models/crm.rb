class Crm < ActiveRecord::Base
	validates :key, uniqueness: true
end
