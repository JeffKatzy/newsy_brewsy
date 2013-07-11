require 'spec_helper'

describe Service do
	let(:user) { "user" }
	let(:service) {Service.new}

	it "puts right login message" do
    	service.login(user).should eq "Service login passes"
  	end

	it "puts right get_interests message" do
    	service.get_interests(user).should eq "Service get_interests passes"
  	end

	it "puts right get_contacts message" do
    	service.get_contacts(user).should eq "Service get_contacts passes"
  	end  	
end
