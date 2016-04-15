class Manager::SessionsController < Manager::BaseController

  def new
  end

  def create
    @manager = Manager.find_by(username: params[:session][:username])
    if @manager && @manager.authenticate(params[:session][:password])
      session[:manager_id] = @manager.id
      redirect_to managers_path(@manager)
    else
    end
  end

end
