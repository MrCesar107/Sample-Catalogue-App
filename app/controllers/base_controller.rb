# frozen_string_literal: true

# All controllers in project must inherit from this controller
class BaseController < ApplicationController
  before_action :authenticate_user!
end
