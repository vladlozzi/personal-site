class Project < ApplicationRecord
  validates :name, presence: {message: "Введіть назву проєкту!"},
            uniqueness: {message: "Проєкт з такою назвою вже є."}
  validates :href, url: {message: "Введіть коректне посилання на проєкт!"},
            uniqueness: {message: "Проєкт з таким посиланням вже є."}
  validates_format_of :years,
                      with: /\A\d{4}-\d{4}?\z/,
                      message: "Введіть коректний проміжок у форматі 20xx-20yy !"
end
