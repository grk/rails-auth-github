module RailsAuthGithub
  module Helpers
    extend ActiveSupport::Concern

    included do
      helper_method :github_user, :github_public_organization_access?,
        :github_organization_access?, :github_team_access?

      rescue_from RailsAuthGithub::Unauthorized, :with => :github_unauthorized_user
    end

    def warden
      request.env['warden']
    end

    def authenticate!(*args)
      warden.authenticate!(*args)
    end

    def authenticated?(*args)
      warden.authenticated?(*args)
    end

    def logout!
      warden.logout
    end

    def github_user
      warden.user
    end

    def github_raw_request(path)
      github_user.github_raw_request(path)
    end

    def github_request(path)
      github_user.github_request(path)
    end

    def github_public_organization_access?(name)
      github_user.publicized_organization_member?(name)
    end

    def github_organization_access?(name)
      github_user.organization_member?(name)
    end

    def github_team_access?(team_id)
      github_user.team_member?(team_id)
    end

    def github_public_organization_authenticate!(name)
      authenticate!
      raise RailsAuthGithub::Unauthorized unless github_public_organization_access?(name)
    end

    def github_organization_authenticate!(name)
      authenticate!
      raise RailsAuthGithub::Unauthorized unless github_organization_access?(name)
    end

    def github_team_authenticate!(team_id)
      authenticate!
      raise RailsAuthGithub::Unauthorized unless github_team_access?(team_id)
    end

    def github_unauthorized_user
      head 401
    end
  end
end
