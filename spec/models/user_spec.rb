require 'spec_helper'

describe User do
  subject { FactoryGirl.create(:user) }

  it { should respond_to(:provider) }
  it { should respond_to(:uid) }
  it { should respond_to(:name) }
  it { should respond_to(:oauth_token) }
  it { should respond_to(:oauth_expires_at) }

  it "has a factory valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "creates a new facebook instance" do
    user.service.class == 'Facebook'
  end

  # # describe "#likes" do
  # #   let(:user) { Factory(:user) }

  # #   it "should return the items that the user liked" do
  # #     user.
  # #   end
  # # end

  # # describe '#retrieve articles' do
  # #   let(:user) { Factory(:user) }

  # #   it "should return a hash of articles" do
  # #     articles_hash = [{"confidence"=>0.019916,
  # #       "published_datetime"=>"2013-07-02T15:48:19Z",
  # #       "title"=>"The Phillies Are Averaging 5,871 Fewer Fans Per Home Game",
  # #       "url"=>
  # #       "http://the700level.com/top-posts/the-phillies-are-averaging-5871-fewer-fans-per-home-game/",
  # #       "retweets"=>26,
  # #       "text_preview"=>
  # #       "Phillies beat writer Matt Gelb penned another article this morning about Ruben Amaro Jr. looking at the looming trade d",
  # #       "article_id"=>181810482,
  # #       "zemified"=>0,
  # #       "likes"=>2},
  # #       {"confidence"=>0.012663,
  # #         "published_datetime"=>"2013-07-03T03:27:01Z",
  # #         "title"=>"Phillies 3, Pirates 1",
  # #         "url"=>
  # #         "http://triblive.com/sports/pirates/4292123-74/phillies-pirates-cumpton",
  # #         "retweets"=>5,
  # #         "text_preview"=>
  # #         "Published: Tuesday, July 2, 2013, 10:27 p.m.\nUpdated 9 minutes ago\nWhen a pair of rookies staged a pitchers' duel Tue",
  # #         "article_id"=>181940312,
  # #         "zemified"=>0,
  # #         "likes"=>4}]
  # #         ZemantaClient.should_receive(:generate_articles_from).and_return(articles_hash)
  # #         user.retrieve_articles
  # #       end

  # #       it "should return user likes as the keys" do
  # #       end
  #     end
    end
