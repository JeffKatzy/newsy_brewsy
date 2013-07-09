# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "facebook"
    uid "1305863"
    name "Jeffrey Katz"
    oauth_token "CAACFypnqMWYBAGNtdkf1MvGcL0b9peggKgMDARZB4ZArYkkG9W..."
    oauth_expires_at "2013-08-30 13:46:34"
  end
end
