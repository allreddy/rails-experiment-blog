module Greenhouse
    class Department < Base
        attr_accessor   :id,
                        :name,
                        :jobs

        def self.get_all(company)
            response = Request.get_departments(company)
            departments = response.fetch('departments', []).map { |department| Department.new(department) }
            [ departments, response[:errors] ]
        end

        def initialize(args = {})
            super(args)
            self.jobs = parse_jobs(args)
        end

        def parse_jobs(args = {})
            args.fetch('jobs', []).map { |job| Job.new(job) }
        end
    end
end
                    