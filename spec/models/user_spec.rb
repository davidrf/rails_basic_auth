require 'rails_helper'

describe User do
  subject {
    User.new(
      username: 'tombrady',
      email: 'goat@gmail.com',
      password: 'password1'
    )
  }

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
