class GithubAuthController < ApplicationController
  def callback
    authenticate!
    redirect_to session['return_to'] || root_url
  end

  def failed
    render :inline =>
      "<center><%= image_tag 'rails-auth-github/securocat.png' %></center>"
  end
end
