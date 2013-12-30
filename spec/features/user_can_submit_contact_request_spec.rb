require 'spec_helper'

feature "User can submit a contact inquiry", %q{
    As a site visitor
    I want to contact the site's staff
    So that I can tell them how awesome they are} do
  # I must specify a valid email address
  # I must specify a subject
  # I must specify a description
  # I must specify a first name
  # I must specify a last name

  it 'sees the contact inquiry form' do
    visit '/contacts/new'
    expect(page).to have_content("Submit a Contact Inquiry")
  end

end
