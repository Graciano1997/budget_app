class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except:[:splash]

    def splash
        redirect_to groups_path if current_user
    end
end
