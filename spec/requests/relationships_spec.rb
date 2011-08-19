require 'spec_helper'

describe "Relationships" do
  before(:each) do
    @user = Factory(:user)
    integration_sign_in(@user)
	
	@other_user = Factory(:user,:email => Factory.next(:email))
  end

  it "should follow a user" do
	visit user_path(@other_user)
	click_button
	@user.following.should include(@other_user)
	@other_user.followers.should include(@user)
	
  end  
  
  describe "unfollow" do
  
    before(:each) do
      visit user_path(@other_user)
	  #follow the @other_user
	  click_button
    end
  
    it "should unfollow a user" do
    
	  #unfollow the @other_user
	  visit user_path(@other_user)
	  click_button
	  @user.following.should_not include(@other_user)
	  @other_user.followers.should_not include(@user)
    end
  end
end
