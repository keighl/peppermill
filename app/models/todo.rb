class Todo < ActiveRecord::Base

  attr_accessible :due_at, :name, :priority

  belongs_to :user

  # Scope ##################################

  scope :complete, where(complete: true)
  scope :incomplete, where(complete: true)

  # Validations ############################

  validates_presence_of :name, :user

  # Priority Enum ###########################

  def priority
    TODO_PRIORITIES.key read_attribute(:priority)
  end

  def priority=(s)
    write_attribute :priority, TODO_PRIORITIES[s.to_sym]
  end
end
