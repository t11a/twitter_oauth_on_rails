# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_my_twitter_oauth_session',
  :secret      => '62c73b93ac73942f56ea9b73952b1bbd514049311cd83666a6e1ce4995cd3f64831bb819c799d2ebad526fe9084c1f262a8527f16540c707772bcdb3912a4ffb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
