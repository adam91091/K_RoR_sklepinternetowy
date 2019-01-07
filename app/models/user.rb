class User < ApplicationRecord
  has_many :orders, as: :owner
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validate :password_complexity

  def password_complexity
    return if password =~ /\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,12}\z/
    if !password.blank?
      errors.add :password, 'length should be 8-12 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
    end
  end
  
end
