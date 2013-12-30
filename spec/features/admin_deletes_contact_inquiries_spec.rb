require 'spec_helper'

feature 'Admin can delete a contact inquiry', %q{
    As an admin
    I want to delete an inquiry
    So that I can remove spam or other undesirable inquiries} do

  it 'can see the delete link from the index page' do
    FactoryGirl.create(:contact)
    visit '/contacts'
    expect(page).to have_content("Delete")
  end

  it 'can delete the link from the index page' do
    blah = FactoryGirl.create(:contact)
    visit '/contacts'
    click_on 'Delete'
    expect(page).to_not have_content(blah.subject)
    expect(Contact.all.count).to eql(0)
  end

end
