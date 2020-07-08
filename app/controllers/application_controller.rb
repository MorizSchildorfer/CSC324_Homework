class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "Hyello you stinky lizard. Go eat a fly, ugly."   
  end

end
