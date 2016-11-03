class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  NBR_LINE = 7
end
