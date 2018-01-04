class User < ApplicationRecord
    has_secure_password

   enum role: %w(default admin)
end
