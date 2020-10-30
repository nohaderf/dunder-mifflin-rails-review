class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.create(employee_params)
        if @employee.valid?
            redirect_to employee_path(@employee)
        else
            flash[:employee_errors] = @employee.errors.full_messages
            #@employee_errors = @employee.errors.full_messages

            redirect_to new_employee_path
        end
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog, :img_url)
    end


end
