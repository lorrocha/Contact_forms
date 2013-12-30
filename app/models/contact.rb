class Contact < ActiveRecord::Base
  validates_presence_of :first_name, notice:"Whoa! Can't be blank"
  validates_presence_of :last_name
  validates_format_of :email, :with=>/\A[^@\s]+@[^@\s\.]+\.[a-zA-Z]+\z/
  validates_presence_of :subject
  validates_presence_of :description
end
