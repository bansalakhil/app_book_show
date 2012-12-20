class AccountsController < ApplicationController

  before_filter :authorize_user, :only => [:show]

  def new
    @account = User.new
    flash.now[:hide_links] = true
  end
  
  def create
    @account = User.new(params[:user])
    if @account.save
      redirect_to root_url, :notice => 'Account successfully created'
    else
      flash.now[:hide_links] = true
      render :action => :new
    end
  end

  def show
    @transactions = @user.transactions
  end

end
