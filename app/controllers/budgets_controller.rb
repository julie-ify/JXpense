class BudgetsController < ApplicationController
  load_and_authorize_resource
  def edit
    @budget = Budget.find_or_create_by!(user_id: current_user.id)
  end

  def update
    @budget = Budget.find_by(id: params[:id])
    new_amount = params[:budget][:amount].to_i
    previous_amount = @budget.amount.to_i
    final_amount = previous_amount + new_amount

    if @budget.update(budget_params.merge(amount: final_amount))
      redirect_to categories_path, notice: 'Budget was successfully updated!.'
    else
      render :edit
    end
  end

  private

  def budget_params
    params.require(:budget).permit(:amount, :exchange_rate_id)
  end
end
