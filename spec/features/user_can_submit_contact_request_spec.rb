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

  it 'can submit a valid contact inquiry' do
    visit '/contacts/new'
    fill_in "Email", with: "Awesome@cool.com"
    fill_in "First name", with: "Bobbeh"
    fill_in "Last name", with: "da Costa"
    fill_in "Subject", with: "general"
    fill_in "Description", with: "WOW man u r just so cool"
    click_on "Submit Inquiry"

    expect(Contact.all.count).to eql(1)
  end

  it 'cannot submit an invalid or incomplete contact inquiry' do
    visit '/contacts/new'
    click_on "Submit Inquiry"
    expect(page).to have_content("First name can't be blank")
    expect(Contact.all.count).to eql(0)
  end
end
