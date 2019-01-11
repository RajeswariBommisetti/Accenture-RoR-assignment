json.employees do
  json.partial! 'employee', collection: @employees, as: :employee
end