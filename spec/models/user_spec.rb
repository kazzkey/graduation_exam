# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null
#  admin                  :boolean          default(FALSE)
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  name                   :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  student_id             :integer          not null, primary key
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_student_id            (student_id) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  it '学籍番号、名前、メール、パスワードがある場合、有効である' do
    user = User.new(
      id: 1,
      student_id: 202020,
      name: '田中太郎',
      email: 'tanaka@example.com',
      password: 'password',
    )
    expect(user).to be_valid
  end

  it '学籍番号がない場合、無効である' do
    user = User.new(
      id: 1,
      student_id: nil,
      name: '田中太郎',
      email: 'tanaka@example.com',
      password: 'password',
    )
    expect(user).to be_invalid
  end

  it '名前がない場合、無効である' do
    user = User.new(
      id: 1,
      student_id: 202020,
      name: nil,
      email: 'tanaka@example.com',
      password: 'password',
    )
    expect(user).to be_invalid
  end

  it 'メールアドレスがない場合、無効である' do
    user = User.new(
      id: 1,
      student_id: 202020,
      name: '田中太郎',
      email: nil,
      password: 'password',
    )
    expect(user).to be_invalid
  end

  it 'パスワードがない場合、無効である' do
    user = User.new(
      id: 1,
      student_id: 202020,
      name: '田中太郎',
      email: 'tanaka@example.com',
      password: nil,
    )
    expect(user).to be_invalid
  end

  it '重複したメールアドレスの場合、無効である' do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.build(:user)
    user2.valid?
    expect(user2.errors[:email]).to include('はすでに存在します')
  end

  it '重複した学籍番号の場合、無効である' do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.build(:user)
    user2.valid?
    expect(user2.errors[:student_id]).to include('はすでに存在します')
  end
end
