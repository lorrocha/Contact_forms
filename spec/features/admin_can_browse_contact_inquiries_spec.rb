require 'spec_helper'

feature "Admin can browse contact inquires", %q{
  As an admin
  I want to review contact inquiries
  So that I can respond or take action} do
    # I can see a list of all contact inquiries

    it 'can see a list of all contact inquires' do
      contact = FactoryGirl.create(:contact)
      contact2 = FactoryGirl.create(:contact, subject:'TOO MUCH AWESOME')
      visit '/contacts'
      expect(page).to have_content(contact.subject)
      expect(page).to have_content(contact2.subject)

    end
  end
