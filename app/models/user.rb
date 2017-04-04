class User < ApplicationRecord

	has_many :rooms, dependent: :destroy
	has_many :messages, dependent: :destroy

	validates_presence_of :name
	validates_uniqueness_of :name

end
