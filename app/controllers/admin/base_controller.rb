# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    layout "admin"
    before_action :check_admin_permission

    include SuggestsHelper

    def check_admin_permission
      redirect_to root_path, notice: t(".not_admin") unless current_user.try :admin?
    end
  end
end
