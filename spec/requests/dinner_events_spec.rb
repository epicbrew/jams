require 'spec_helper'

describe "DinnerEvents" do
  login :admin
  
  describe "GET /dinner_events" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get dinner_events_path
      response.status.should be(200)
    end
  end
end
