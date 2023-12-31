class OperationsController < ApplicationController
  def index
    @group_operations = current_user.groups.where(id: params[:group_id]).first.group_operations.where(group_id: params[:group_id]).order(created_at: :desc)
    @total = Operation.where(author: current_user).joins(:group_operations).where(group_operations: { group_id: params[:group_id] }).sum(:amount)
  end

  def new
    @group = Group.find(params[:group_id])
    @operation = Operation.new
    @categories = current_user.groups
  end

  def create
    @operation = Operation.new(operation_params)
    @operation.author = current_user
    if @operation.save
      @groups = Group.find(params[:operation][:category_ids])
      @groups.each do |group_item|
        @group_operation = GroupOperation.new
        @group_operation.operation = @operation
        @group_operation.group = group_item
        @group_operation.save
      end
      redirect_to group_operations_path(group_id: params[:group_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount, :category_ids)
  end
end
