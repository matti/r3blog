["R3BLOG_USER", "R3BLOG_PASS", "R3BLOG_COOKIE_SECRET_TOKEN"].each do |check_env|
  raise "#{check_env} environment value not set" unless ENV[check_env]
end

module R3blog
  module Config
    CookieSecretToken = ENV['R3BLOG_COOKIE_SECRET_TOKEN']
    
    module Admin
      USER = ENV['R3BLOG_USER']
      PASS = ENV['R3BLOG_PASS']
    end
  end
end