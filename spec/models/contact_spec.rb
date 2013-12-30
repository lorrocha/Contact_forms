require 'spec_helper'

describe Contact do
  it {should have_valid(:first_name).when('Weeee')}
  it {should_not have_valid(:first_name).when(nil, '')}
  it {should have_valid(:last_name).when('Weeee')}
  it {should_not have_valid(:first_name).when(nil,'')}
  it {should have_valid(:email).when('blank@blank.com')}
  it {should_not have_valid(:email).when('Weeee', nil, '')}
  it {should have_valid(:subject).when('Weeee')}
  it {should_not have_valid(:subject).when(nil, '')}
  it {should have_valid(:description).when('Weeee')}
  it {should_not have_valid(:description).when(nil, '')}

  it 'can have factory girl objects made' do
    FactoryGirl.create(:contact)
    FactoryGirl.create(:contact)
    expect(Contact.all.count).to eql(2)
  end

end
