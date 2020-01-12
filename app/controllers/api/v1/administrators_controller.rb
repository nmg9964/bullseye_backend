class Api::V1::AdministratorsController < ApplicationController

  def index
    admins = Administrator.all
    render json: admins, include: :events
  end

  def login
    admin = Administrator.find_by(username: params[:username])
    if admin && admin.authenticate(params[:password])
      token = JWT.encode({ admin_id: admin.id }, 'secretkey', 'HS256')
      render json: { id: admin.id, username: admin.username, events: admin.events, token: token }
    else
      render json: { error: 'invalid credentials' }, status: 401
    end
  end

  def authorize
    token = request.headers['Authorization'].split(' ')[1]
    decode = JWT.decode token, 'secretkey', true, { algorithm: 'HS256' }
    admin_id = decode[0]['admin_id']
    admin = Administrator.find(admin_id)

    if (admin)
      render json: { id: admin.id, username: admin.username, events: admin.events, token: token }
    else
      render json: { error: 'Invalid Credentials' }, status: 401
    end
  end

end
