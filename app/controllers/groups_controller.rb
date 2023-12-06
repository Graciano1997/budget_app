class GroupsController < ApplicationController
    def index
        @categories=current_user.groups
    end

    def new
        @group=Group.new
    end

    def create
        @group=Group.new(group_params)
        @group.user=current_user
        if @group.save
            redirect_to groups_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
    end

    def destroy
    end

    private 

    def group_params
        params.require(:group).permit(:name,:icon)
    end
end
