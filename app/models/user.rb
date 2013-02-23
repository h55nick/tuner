# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  image           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  is_admin        :boolean          default(FALSE)
#  balance         :decimal(, )      default(0.0)
#

class User < ActiveRecord::Base
    attr_accessible :name, :image, :password, :password_confirmation,:balance
    has_and_belongs_to_many :albums
    has_many :mixtapes
    validates_numericality_of :balance, :greater_than_or_equal_to => 0
    validates :name, :length => { :minimum => 2 }
    validates :name ,:uniqueness => true
#validates :password, :length => { :minimum => 2 }

    has_secure_password
end
