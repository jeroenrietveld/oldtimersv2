class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username, :first_name, :last_name

  attr_accessible :username, :first_name, :last_name, :email, :password, :password_confirmation, :current_password

  has_many :questions
  has_many :answers
  has_many :comments

  make_flagger
end