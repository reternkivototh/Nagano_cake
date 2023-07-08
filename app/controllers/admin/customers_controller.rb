class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.all
    @customers = Customer.page(params[:page])
  end

  def show
  end

  def edit
  end
end
