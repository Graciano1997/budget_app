class OperationsController < ApplicationController
    def index
      @group_operations=current_user.groups.where(id:params[:group_id]).first.group_operations.where(group_id:params[:group_id]).order(created_at: :desc)
    end

    def new
      @group=Group.find(params[:group_id])
      @operation=Operation.new
      @categories=current_user.groups
    end

    def create

    end

    def show
    end
end
