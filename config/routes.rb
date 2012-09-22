Rails.application.routes.draw do
  match "auth/github/callback", :to => "github_auth#callback"
  match "auth/github/failed", :to => "github_auth#failed"
end
