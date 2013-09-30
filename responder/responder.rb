require 'right_hook/app'
require 'right_hook/event'
require 'right_hook/logger'
require 'logger'

RightHook.logger = Logger.new(STDERR)

class Responder < RightHook::App
  def on_pull_request(owner, repo_name, action, number, pull_request_json)
    comment_like_a_parrot(owner, repo_name, number) if action == 'opened'
  end

  def on_issue(owner, repo_name, action, issue_json)
    comment_like_a_parrot(owner, repo_name, issue_json['number']) if action == 'opened' || action == 'reopened'
  end

  def secret(owner, repo_name, event_type)
    ENV['RESPONDER_SECRET']
  end

  def comment_like_a_parrot(owner, repo_name, number)
    message = 'Squawk! Thank you for the pull request or issue. Squawk!'
    RightHook::Commenter.new(ENV['RESPONDER_TOKEN']).comment_on_issue(owner, repo_name, number, message)
  end
end
