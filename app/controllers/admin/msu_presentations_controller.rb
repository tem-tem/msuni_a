class Admin::MsuPresentationsController < ApplicationController

  def index
    @file = Rails.root.join("public", "test.pdf")
  end

  def new

  end

end
