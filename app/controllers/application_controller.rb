class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
    layout 'application'

  end
    def show
    @user = User.find(params[:id])
    @titre = @user.nom
  end
   def help
    @title = "Aide"
  end

