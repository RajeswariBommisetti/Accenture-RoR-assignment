class Role < ApplicationRecord
  has_ancestry
  enum title: { 'CEO' => 0, 'VP' => 1, 'Director' => 2, 'Manager' => 3, 'SDE' => 4 }
  validates :title, presence: true
  has_many :employees
end
