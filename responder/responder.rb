require 'right_hook/app'

class Responder < RightHook::App
  def on_pull_request(owner, repo_name, action, number, pull_request_json)
    comment_like_a_parrot(owner, repo_name, number) if action == 'opened'
  end

  def secret(owner, repo_name, event_type)
    ENV['RESPONDER_SECRET']
  end

  def comment_like_a_parrot(owner, repo_name, number)
    message = 'Squawk! Thank you for the pull request. Squawk!'
    RightHook::Commenter.new(ENV['RESPONDER_TOKEN']).comment_on_issue(owner, repo_name, number, message)
  end
end
