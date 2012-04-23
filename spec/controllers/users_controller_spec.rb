require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do

      before(:each) do
        @user = Factory(:user)
      end

      it "devrait réussir" do
        get :show, :id => @user
        response.should be_success
      end

      it "devrait trouver le bon utilisateur" do
        get :show, :id => @user
        assigns(:user).should == @user
      end
      
  describe "GET 'new'" do

    it "devrait réussir" do
      get 'new'
      response.should be_success
    end

    it "devrait avoir le bon titre" do
      get 'new'
      response.should have_selector("title", :content => "Sign up")
    end
  end
end