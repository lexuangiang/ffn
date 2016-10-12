class Admin::WelcomeController < ApplicationController
  before_action :verify_admin
  layout "admin_application"
end
