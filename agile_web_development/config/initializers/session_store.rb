# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lojinha_session',
  :secret      => 'b4a9119b3f553edb425ecec3978afd32184c77abb981d6d807cb20d688b9ded5fb9c32a458aeebe9cc6263b6f2c746f5ee4dbfb315ed303b56ce4fa6f3982899'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
