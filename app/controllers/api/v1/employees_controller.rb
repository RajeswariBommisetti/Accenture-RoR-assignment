class Api::V1::EmployeesController < ApplicationController
 
  # GET api/v1/employees
  def index
    @employees  = Employee.all
  end

  # POST api/v1/employees
  def create
    employee = Employee.new(employee_params)
    render json: { message: "#{employee.name} has created successfully"} , status: :created if employee.save!
  end

  # GET api/v1/employees/highest_paid_employees
  def highest_paid_employees
    @employees = Employee.order('salary desc').limit(10)
  end

  # GET api/v1/employees/:id
  def show
    @employee = Employee.find(params(:id))
  end

  # PUT api/v1/employees/:id/resign
  def resign
    emp = Employee.find(params(:id))
    if emp.update!(resigned: true) && emp.reportees.present?
      emp.reportees.update_all(reporter_id: emp.reporter_id )
      render json: { message: "Employee resigned successfully"} , status: :ok
    end
  end

  # GET api/v1/employees/:id/reporters_hierarchy
  def reporters_hierarchy
    emp = Employee.find(arams(:id))
    @ancestors = Employee.where(role_id: emp.role.ancestor_ids)
    render json: { supervisor: @supervisor, reportees: @reportees }, status: :ok
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :salary, :rating, :role_id, :reporter_id)
  end

end
