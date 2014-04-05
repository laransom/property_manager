require 'spec_helper'

feature 'add a new building record', %q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

  scenario 'successfully registers building with valid attributes' do
    pre_count = Building.count
    visit new_building_path

    fill_in 'Street Address', with: '2020 Central Park West'
    fill_in 'City', with: 'New York City'
    select 'NY', from: 'State'
    fill_in 'Zip Code', with: '02345'
    fill_in 'Description', with: 'Fixer Upper'

    click_on 'Record Building'

    expect(page).to have_content 'Building was succesfully recorded'
    expect(Building.count).to eq(pre_count + 1)
  end

  scenario 'fills registration form with invalid attributes' do
    pre_count = Building.count
    visit new_building_path

    click_on 'Record Building'

    expect(page).to have_content("can't be blank")
    expect(Building.count).to eq(pre_count)
  end

  scenario 'fills registration with invalid zip code' do
    pre_count = Building.count
    visit new_building_path

    fill_in 'Zip Code', with: '398'

    click_on 'Record Building'

    expect(page).to have_content('is the wrong length')
    expect(Building.count).to eq(pre_count)

  end

end
