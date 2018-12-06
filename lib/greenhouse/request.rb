require 'rest_client'
require 'json'

class Request
    class << self
        BASE = 'https://api.greenhouse.io/v1/boards'
        DEPARTMENTS = 'https://api.greenhouse.io/v1/boards/joinhandshake/embed/departments'

        def get_company(name)
            response, status = get_json("#{BASE}/#{name}")
            status == 200 ? response : errors(response)
        end

        def get_departments(company)
            response, status = get_json("#{BASE}/#{company}/embed/departments")
            status == 200 ? response : errors(response)
        end

        def get_json(path)
            begin
                response = RestClient.get(path)
                [JSON.parse(response), response.code]
            rescue RestClient::ExceptionWithResponse => e
                [JSON.parse(e.response), e.response.code]
            end
        end

        def errors(response)
            puts response["status"]
            puts response["message"]
            error = { errors: { status: response["status"], message: response["error"] }}
            response.merge(error)
        end

    end
end
