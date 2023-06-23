#user = FactoryBot.create(:user)
FactoryBot.define do
  factory :tweet do
    content { "content of tweet"}
    association :user
  end
end
