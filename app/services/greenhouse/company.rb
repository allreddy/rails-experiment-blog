module Greenhouse
    class Company < Base
        attr_accessor   :name,
                        :content

        def self.get(name)
            response = Request.get_company(name)
            company = Company.new(response)
            [ company, response[:errors]]
        end

    end
end