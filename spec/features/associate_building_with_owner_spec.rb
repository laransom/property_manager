require 'spec_helper'

feature 'optionally associate building with owner', %q{
  A a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do

  scenario 'Register building with owner' do
    pre_count = Owner.count
    owner = FactoryGirl.create(:owner)

    visit new_building_path

    fill_in 'Street Address', with: '2020 Central Park West'
    fill_in 'City', with: 'New York City'
    select 'NY', from: 'State'
    fill_in 'Zip Code', with: '02345'
    fill_in 'Description', with: 'Fixer Upper'
    select 'Benedict Arnold', from: 'Owner'

    click_on 'Record Building'

    expect(page).to have_content 'Building was succesfully recorded'
    expect(Building.count).to eq(pre_count + 1)
  end

end
