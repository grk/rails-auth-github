# rails-auth-github

A simple Rails plugin that provides authentication with github oauth.

It's basically a port of [sinatra_auth_github](https://github.com/atmos/sinatra_auth_github) to Rails.

**Note:** this is an initial release, so it may be buggy. Use at your own risk.

## Install

Add the gem to your Gemfile:

```ruby
gem "rails-auth-github", "~> 0.0.1"
```

## Configure

You can configure rails-auth-github using `config.github_auth` in either
config/application.rb or environment-specific config files, with following
options:

  * `config.github_auth.client_id` (required)
  * `config.github_auth.client_secret` (required)
  * `config.github_auth.scopes`
  * `config.github_auth.oauth_domain`
  * `config.github_auth.callback_url`

## Usage

This engine provides following helpers for use in controllers:

`authenticate!`

`authenticated?`

`logout!`

`github_user`

`github_raw_request(path)`

`github_request(path)`

`github_public_organization_access?(name)`

`github_organization_access?(name)`

`github_team_access?(team_id)`

`github_public_organization_authenticate!(name)`

`github_organization_authenticate!(name)`

`github_team_authenticate!(team_id)`

Also, `github_user`, `github_public_organization_access?`,
`github_organization_access?`, and `github_team_access?` are available as
view helpers.

## TODO

  * tests

