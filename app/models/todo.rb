class Todo < ActiveRecord::Base

  attr_accessible :due_at, :name, :priority, :complete

  belongs_to :user

  # Scope ##################################

  scope :complete, where(complete: true)
  scope :incomplete, where(complete: false)
  scope :by_incomplete, order('todos.complete ASC, todos.due_at ASC, todos.priority DESC')
  scope :by_priority, order('todos.priority DESC, todos.complete ASC')
  scope :by_due_date, order('todos.due_at ASC, todos.complete ASC')

  # Validations ############################

  validates_presence_of :name, :user, :due_at

  validates_length_of :name, maximum: 30

  # Callbacks #############################

  before_validation :establish_due_at

  def establish_due_at
    self.due_at = Date.today if due_at.nil?
  end
end
