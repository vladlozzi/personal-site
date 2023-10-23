require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        years: "2000-2006",
        href: "http://project1.com",
        name: "Project Name 1"
      ),
      Project.create!(
        years: "2016-",
        href: "https://project2.com",
        name: "Project Name 2"
      )
    ])
  end

  it "renders a list of projects" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("2000-2006".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("http://project1.com".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("Project Name 1".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("2016-".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("https://project2.com".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("Project Name 2".to_s), count: 1
  end
end
