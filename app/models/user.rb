class User < ActiveRecord::Base

  attr_accessible :email,
    :name,
    :password,
    :password_confirmation

  authenticates_with_sorcery!

  # Validations #######################

  # Name
  validates_presence_of :first_name
  validates_presence_of :last_name

  # Email
  validates_presence_of   :email
  validates_uniqueness_of :email
  validates_format_of     :email, :with => EMAIL_REGEX

  # Password
  validates_presence_of     :password, :on => :create
  validates_confirmation_of :password, :if => :password
  validates_length_of       :password, :minimum => 6, :maximum => 16, :if => :password

  ############################

  def name
    "#{first_name} #{last_name}"
  end

  def self.search(search = nil)
    if search
      where('first_name LIKE ? OR first_name LIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
end
