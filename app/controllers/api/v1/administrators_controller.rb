class Api::V1::AdministratorsController < ApplicationController

  def index
    admins = Administrator.all
    render json: admins, include: :events
  end

  def show
    # admin = Administrator.find_by(:id)
    # render json: admin, include: :events
  end

  def login
    admin = Administrator.find_by(username: params[:username])
    if admin && admin.authenticate(params[:password])
      render json: admin, include: :events
    else
      render json: { error: 'invalid credentials' }, status: 401
    end
  end

  def create
    # admin = Administrator.find_or_create_by(username: params[:username], password: params[:password])
    # render json: admin, include: :events
  end

end
