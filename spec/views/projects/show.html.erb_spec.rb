require 'rails_helper'

RSpec.describe "projects/show", type: :view do
  before(:each) do
    assign(:project, Project.create!(
      years: "2000-2023",
      href: "https://project.com",
      name: "Project Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2000-2023/)
    expect(rendered).to match(/https:\/\/project.com/)
    expect(rendered).to match(/Project Name/)
  end
end
