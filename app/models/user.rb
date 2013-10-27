class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :generate_recurly_account_code, on: :create
  validates :recurly_account_code, uniqueness: true, presence: true

  def generate_recurly_account_code
    self.recurly_account_code ||= SecureRandom.uuid
  end
end
