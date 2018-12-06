class DepartmentsController < ApplicationController
include Greenhouse
    def index
        @departments, @errors = Greenhouse::Department.get_all('joinhandshake')
    end
end
