require 'rails_helper'

describe Administrator do
  let(:attributes) do
    {
      username: 'username',
      password_digest: 'password',
      email_address: 'email address'
    }
  end

  let(:missing_username) { attributes.except(:username) }
  let(:missing_password_digest) { attributes.except(:password_digest) }
  let(:existing_username) { attributes.merge(username: 'sam') }

  it 'is valid when expected' do
    expect(Administrator.new(attributes)).to be_valid
  end

  it "is invalid without username" do
    expect(Administrator.new(missing_username)).to be_invalid
  end

  it "is invalid without password digest" do
    expect(Administrator.new(missing_password_digest)).to be_invalid
  end

  it "is invalid with non-unique username" do
    Administrator.create(username: 'sam', password_digest: 'password', email_address: 'email address')
    expect(Administrator.new(existing_username)).to be_invalid
  end
end