class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate

  def authenticate
    if not params[:format] ==:json
      return true 
    end
    unless User.find_by_token(request.env['HTTP_TOKEN']).present?
      respond_to do |format|
        format.json { render :json =>{errors: {access: 'Not granted'}}, status: 401 }
      end
    end
  end


end
