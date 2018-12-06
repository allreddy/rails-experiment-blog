module Greenhouse
    class Job < Base
        attr_accessor   :id,
                        :title,
                        :location,
                        :absolute_url

        def initialize(args = {})
            super(args)
            self.location = parse_location(args)
        end

        def parse_location(args = {}) 
            args.fetch('location').fetch('name')
        end
    end
end