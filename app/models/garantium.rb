class Garantium < ActiveRecord::Base
	validates :key, uniqueness: true
end
