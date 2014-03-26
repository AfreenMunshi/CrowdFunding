class UsersController < ApplicationController

before_filter :authenticate_user!, only: [:show]

def show
  @user = User.find(current_user.id)
end

end
