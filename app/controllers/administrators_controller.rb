class AdministratorsController < ApplicationController

  def index
    admins = Administrator.all
    render json: admins, include: :events
  end

  def create
    admin = Administrator.find_or_create_by(username: params[:username], password: params[:password])
    render json: admin
  end

end
