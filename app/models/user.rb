class User < ApplicationRecord
  has_secure_password

  after_destroy :ensure_an_admin_remains

  class Error < StandardError
  end

  def update_with_password(params)
    current_password = params.delete(:current_password)

    if authenticate(current_password)
      update(params)
    else
      errors.add(:current_password, "is incorrect")
      false
    end
  end

  private

  def ensure_an_admin_remains
    if User.count.zero?
      raise Error.new "Can't delete last user"
    end
  end
end
