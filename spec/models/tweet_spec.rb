require 'rails_helper'
require 'byebug'
RSpec.describe Tweet, type: :model do
  let(:user) {User.new(id:1,username: "Jack", name: "Smith", email: "jsmith@sample.com" )}
  subject { Tweet.new(id:11,content: "new tweet conten", user_id: user.id,user:user )}
  
  it "is not valid without a content" do
    subject.content=nil
    expect(subject).to_not be_valid
  end
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a user" do
    subject.user_id=nil
    expect(subject).to_not be_valid
  end
end
