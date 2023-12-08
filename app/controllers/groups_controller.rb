class GroupsController < ApplicationController
    def index
        @total_categories=[]
        @categories=current_user.groups
        @categories.each do |category|
            total_category=Operation.where(author:current_user).joins(:group_operations).where(group_operations:{group_id:category.id}).sum(:amount)
            @total_categories.push({:category_id=>category.id,:total=>total_category})
        end
        @total_categories
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
