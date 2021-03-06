# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
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
#  student_id             :integer          not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_student_id            (student_id) UNIQUE
#
FactoryBot.define do
  factory :user do
    id { 1 }
    student_id { 202020 }
    name { '山田花子' }
    email { 'yamada@example.com' }
    password { 'password' }
    admin { false }
  end

  factory :admin, class: User do
    id { 2 }
    student_id { 1 }
    name { 'admin' }
    email { 'admin@example.com' }
    password { 'password' }
    admin { true }
  end
end
