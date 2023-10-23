require 'rails_helper'

RSpec.describe "projects/edit", type: :view do
  let(:project) {
    Project.create!(
      years: "2000-2023",
      href: "https://project.com",
      name: "Project Name"
    )
  }

  before(:each) do
    assign(:project, project)
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(project), "post" do

      assert_select "input[name=?]", "project[years]"

      assert_select "input[name=?]", "project[href]"

      assert_select "input[name=?]", "project[name]"
    end
  end
end
