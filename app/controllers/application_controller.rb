class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def title=(title)
    @title = title
  end

  def title
    @title
  end
end
