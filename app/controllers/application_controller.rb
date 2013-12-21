class ApplicationController < ActionController::Base

  def index
  end

  def robots
    robots = File.read Rails.root.join("config", "robots", "#{Rails.env}.txt")
    render text: robots, layout: false, content_type: "text/plain"
  end
end
