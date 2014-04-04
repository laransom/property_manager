require 'spec_helper'

feature 'add a new owner record', %q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

  scenario 'Successfully registers new owner with valid attributes' do
    pre_count = Owner.count
    visit new_owner_path

    fill_in 'First Name', with: 'Sterling'
    fill_in 'Last Name', with: 'Archer'
    fill_in 'Email', with: 'valid@email.com'
    fill_in 'Company Name', with: 'Isis'

    click_on 'Add Owner'

    expect(page).to have_content 'Owner was succesfully added'
    expect(Owner.count).to eq(pre_count + 1)
  end

  scenario 'fills registration form with invalid attributes' do
    visit new_owner_path

    click_on 'Add Owner'

    expect(page).to have_content("can't be blank")
  end

end
