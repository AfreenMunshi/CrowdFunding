class UsersController < ApplicationController
	
before_filter :authenticate_user!, only: [:show]


def show
  @user = User.find(params[:id])
end

# GET /farmers/oauth/1
def oauth
  if !params[:code]
    return redirect_to('/')
  end

  redirect_uri = url_for(controller: :users, action: :oauth, id: :params[:id], host: :request.host_with_port)
  @user = User.find(params[:id])
  begin
    @user.request_wepay_access_token(params[:code], redirect_uri)
  rescue Exception => e
    error = e.message
  end

  if error
    redirect_to @user, alert: error
  else
    redirect_to @user, notice: 'We successfully connected you to WePay!'
  end
end

end