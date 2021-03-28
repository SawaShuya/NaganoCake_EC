class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders


  def active_for_authentication?
    super && (self.is_unsubscribe == false)
  end

  def view_address
		self.postal_code + "　" + self.address + "　" + self.last_name + "　" + self.first_name
	end

  def full_name
    self.last_name + ' ' + self.first_name
  end

end
