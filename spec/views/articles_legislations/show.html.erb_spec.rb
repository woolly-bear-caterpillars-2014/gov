require 'rails_helper'

RSpec.describe "articles_legislations/show", :type => :view do
  before(:each) do
    @articles_legislation = assign(:articles_legislation, ArticlesLegislation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
