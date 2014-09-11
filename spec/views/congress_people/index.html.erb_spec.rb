require 'rails_helper'

RSpec.describe "congress_people/index", :type => :view do
  before(:each) do
    assign(:congress_people, [
      CongressPerson.create!(),
      CongressPerson.create!()
    ])
  end

  it "renders a list of congress_people" do
    render
  end
end
