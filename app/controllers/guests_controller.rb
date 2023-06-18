class GuestsController < ApplicationController
  def user_guest
    user = User.find_or_create_by!(name: 'guestuser', email: 'guest@example.com', user_status: false) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  sign_in user
  redirect_to root_path, notice: 'ゲストユーザーとしてログインしました'
  end

  def admin_guest
    admin = Admin.find_or_create_by!(email: 'admin@example.com') do |admin|
      admin.password = SecureRandom.urlsafe_base64
    end
  sign_in admin
  redirect_to root_path, notice: 'ゲスト管理者としてログインしました'
  end
end
