class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #include helpers so they are accessible by every view & CONTROLLERS!
  include SessionsHelper
  include UsersHelper

end
