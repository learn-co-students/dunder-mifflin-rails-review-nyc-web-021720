class EmployeesController < ApplicationController

    before_action :find_employee, only: [:show, :update, :edit]

    def index
        @employees=Employee.all
    end
    
    def show
    end

    def new
        @employee=Employee.new()
        
    end

    def create
        employee=Employee.create(employee_params)
        if employee.valid?
            redirect_to employee
        else
            flash[:errors]=@employee.errors.full_messages
            redirect_to new_employee_path
        end

    end

    def edit
    end

    def update
        @employee.update(employee_params)
        if @employee.valid?
            redirect_to @employee
        else
            flash[:errors]=@employee.errors.full_messages
            redirect_to edit_employee_path
        end
    end

    private

    def employee_params
        # (:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
        params.require(:employee).permit!

    end

    def find_employee
        @employee=Employee.find(params[:id])
    end



end
