require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(username: "Jackers", name: "Smith",password:"as123d", email: "jsmith@sample.com" )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a username" do
    subject.username=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the username is not 6 chars" do
    subject.username="123er"
    expect(subject).to_not be_valid
  end
  it "is not valid without a name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the email address doesn't have a @" do
    subject.email="abcdef.com"
    expect(subject).to_not be_valid
  end
end
