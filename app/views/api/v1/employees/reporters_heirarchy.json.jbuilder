json.employees do
  json.partial! 'employee', collection: @ancestors, as: :employee
end