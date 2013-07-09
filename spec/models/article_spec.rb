require 'spec_helper'

describe Article do

  subject { FactoryGirl.create(:article) }

  it { should respond_to(:title) }
  it { should respond_to(:url) }
  it { should respond_to(:text_preview) }

  it "has a factory valid factory" do
    FactoryGirl.create(:article).should be_valid
  end
end
