class GroupsController < ApplicationController
    def index
        @categories=current_user.groups
    end

    def new
    end

    def show
    end

    def destroy
    end
end
