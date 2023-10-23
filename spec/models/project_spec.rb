require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project1) { Project.new }
  let(:project2) { Project.new }

  it "is not valid without project name, years and href" do
    expect(project1).not_to be_valid
    expect(project1.errors.messages[:years]).to eq(["Введіть коректний проміжок у форматі 20xx-20yy !"])
    expect(project1.errors.messages[:href]).to eq(["Введіть коректне посилання на проєкт!"])
    expect(project1.errors.messages[:name]).to eq(["Введіть назву проєкту!"])
  end

  it "is valid with project name, years and href" do
    project1.years = "2002-2005"
    project1.href = "https://my-site.ua"
    project1.name = "1st project name"
    expect(project1).to be_valid
  end

  it "is invalid if project name is not unique" do
    project1.years = "2002-2005"
    project1.href = "https://my-site1.ua"
    project1.name = "1st project name"
    project1.save
    project2.years = "2002-2005"
    project2.href = "https://my-site1.ua"
    project2.name = "1st project name"
    expect(project2).not_to be_valid
    expect(project2.errors.messages[:years]).to eq([])
    expect(project2.errors.messages[:href]).to eq(["Проєкт з таким посиланням вже є."])
    expect(project2.errors.messages[:name]).to eq(["Проєкт з такою назвою вже є."])
  end

  it "is valid with different project name and href" do
    project1.years = "2002-2005"
    project1.href = "https://my-site1.ua"
    project1.name = "1st project name"
    project1.save
    project2.years = "2002-2005"
    project2.href = "https://my-site2.ua"
    project2.name = "2st project name"
    expect(project2).to be_valid
  end

end
