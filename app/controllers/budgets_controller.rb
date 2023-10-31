class BudgetsController < ApplicationController
  load_and_authorize_resource

	def new
		@budget = Budget.new
	end

	def create 
		
	end

  def edit
    @budget = Budget.find_or_create_by!(user_id: current_user.id)
  end

  def update
    @budget = Budget.find_by(id: params[:id])
		if params[:budget][:usd_amount]
			usd_amount = params[:budget][:usd_amount]
			previous_usd_amount = @budget.local_amount
			final_amount = previous_usd_amount + usd_amount.to_f

			# local_amount = @budget.exchange_rate.rate_in_usd * final_amount
			if @budget.update!(usd_amount: final_amount, local_amount: local_amount)
      	redirect_to categories_path, notice: 'Budget was successfully updated!.'
    	else
      	render :edit
    	end
		else
			exchange_rate = ExchangeRate.find_by(id: params[:budget][:exchange_rate_id])
			rate_in_usd = exchange_rate.rate_in_usd
			local_amount = @budget.usd_amount * rate_in_usd

			if @budget.update!({exchange_rate_id: params[:budget][:exchange_rate_id], local_amount: local_amount })
      	redirect_to categories_path, notice: 'Currency was successfully updated!.'
    	else
      	render :edit
    	end
		end
  end

  private

  def budget_params
    params.require(:budget).permit(:amount, :exchange_rate_id)
  end
end
