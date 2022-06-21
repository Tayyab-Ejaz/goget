class ApplicationController < ActionController::API
    include JsonWebToken

    before_action :authenticate

    private
    def authenticate
        header = request.headers['Authorization']
        header = header&.split(" ")&.last
        decoded = jwt_decode(header)
        @current_user = User.find(decoded[:user_id])
    end
end
