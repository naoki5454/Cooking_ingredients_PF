class Admins::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page]).per(8)
  end

  def show

  end

  def edit

  end

  def update

  end
end
