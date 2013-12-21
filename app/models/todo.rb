class Todo < ActiveRecord::Base

  attr_accessible :due_at, :name, :priority, :complete

  belongs_to :user

  # Scope ##################################

  scope :complete, where(complete: true)
  scope :incomplete, where(complete: false)

  # Validations ############################

  validates_presence_of :name, :user, :due_at

  # Callbacks #############################

  before_validation :establish_due_at

  def establish_due_at
    self.due_at = Date.today if due_at.nil?
  end

  # Priority Enum ###########################

  def priority
    TODO_PRIORITIES.key read_attribute(:priority)
  end

  def priority=(s)
    write_attribute :priority, TODO_PRIORITIES[s.to_sym]
  end
end
