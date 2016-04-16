class ManagersController < ApplicationController
  # probably need a before action to make sure user is manager

  def index
    @manager = Manager.find(session[:manager_id])
  end

end
