require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, Project.new(
      years: "2000-2023",
      href: "http://project.com",
      name: "Project Name"
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input[name=?]", "project[years]"

      assert_select "input[name=?]", "project[href]"

      assert_select "input[name=?]", "project[name]"
    end
  end
end
