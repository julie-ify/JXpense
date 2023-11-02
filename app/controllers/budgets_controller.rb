class BudgetsController < ApplicationController
  load_and_authorize_resource

  def create
    @budget = Budget.new(budget_params)
    @budget.user = current_user

    if @budget.save
      redirect_to categories_path, notice: 'Budget was successfully created!.'
    else
      render :new
    end
  end

  def edit
    @budget = Budget.find_by(id: params[:id], user_id: current_user.id)
  end

  def update
    @budget = Budget.find_by(id: params[:id], user_id: current_user.id)
    new_budget_amount = @budget.local_amount + params[:budget][:local_amount].to_f
    if @budget.update(local_amount: new_budget_amount)
      redirect_to categories_path, notice: 'Budget was successfully updated!.'
    else
      render :edit
    end
  end

  private

  def budget_params
    params.require(:budget).permit(:local_amount, :exchange_rate_id)
  end
end
