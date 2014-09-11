require 'rails_helper'

RSpec.describe "articles_legislations/index", :type => :view do
  before(:each) do
    assign(:articles_legislations, [
      ArticlesLegislation.create!(),
      ArticlesLegislation.create!()
    ])
  end

  it "renders a list of articles_legislations" do
    render
  end
end
