require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'employees' do
  let(:ceo_role) { create(:role, :CEO) }
  let(:director_role) { create(:role, :Director) }
  let(:ceo_user) { create(:employee, role_id: ceo_role.id) }
  let(:director) { create(:employee, role_id: director_role.id, reporter: ceo_user) }

  get '/api/v1/employees' do
    example 'List all employees' do
      do_request
      status.should == 200
    end
  end

  post '/api/v1/employees' do
    example 'create employees' do
      do_request(employee: { role_id: director_role.id, name: 'test user1', reporter_id: ceo_user.id })
      status.should == 200
    end

    example 'create employees failure ceo should not have reporter' do
      do_request(employee: { role_id: ceo_role.id, reporter_id: director_user.id  })
      status.should == 422
    end
  end

  get '/api/v1/employees/:id' do
    example 'show employee details' do
      do_request(id: ceo_user.id)
      status.should == 200
    end
  end

  put '/api/v1/employees/:id/resign' do
    example 'should be able to resign' do
      do_request(id: ceo_user.id)
      status.should == 200
    end
  end

  get '/api/v1/employees/:id/reporters_hierarchy' do
    example 'show employee details' do
      do_request(id: ceo_user.id)
      status.should == 200
    end
  end

  get '/api/v1/employees/highest_paid_employees' do
    example 'show employee details' do
      do_request(id: ceo_user.id)
      status.should == 200
    end
  end

end