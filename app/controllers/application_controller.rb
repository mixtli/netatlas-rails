require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  protect_from_forgery
  include Userstamp

  before_filter :set_current_user  # required by declarative_authorization for model based access control

   

  protected
  def set_current_user
    Authorization.current_user = current_user
  end
end

