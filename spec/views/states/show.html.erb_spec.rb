require 'rails_helper'

RSpec.describe "states/show", :type => :view do
  before(:each) do
    @state = assign(:state, State.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
