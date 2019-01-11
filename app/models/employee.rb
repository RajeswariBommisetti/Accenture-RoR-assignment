class Employee < ApplicationRecord
  # Validations
  validates :name, presence: true
  # Associations
  belongs_to :role
  # to restict "SDE" role to has have reportees
  has_many :reportees, -> { joins(:role).where('roles.title != ?', 'SDE')}, foreign_key: 'reporter_id', class_name: 'Employee'
  has_one :reporter, -> { joins(:role).where('roles.title != ?', 'CEO') }, foreign_key: 'reporter_id', class_name: 'Employee'

end
