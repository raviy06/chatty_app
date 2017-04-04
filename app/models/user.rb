class User < ApplicationRecord
	include Tokenable

	has_many :rooms, dependent: :destroy
	has_many :messages, dependent: :destroy
	
end
