class ApplicationController < ActionController::Base
  self.responder = Babycasts::Responder
  protect_from_forgery
end
