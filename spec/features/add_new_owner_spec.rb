require 'spec_helper'

feature 'add a new owner record', %q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

  scenario 'Successfully registers new owner with valid attributes' do
    pre_count = Owner.count
    visit new_owner_path

    fill_in :first_name, with: 'Sterling'
    fill_in :last_name, with: 'Archer'
    fill_in :email, with: 'valid@email.com'
    fill_in :company_name, with: 'Isis'

    click_on 'Add Owner'

    expect(page).to have_content 'Owner was succesfully added'
    expect(page).to have_content 'Sterling Archer'
    expect(Owner.count).to eq(pre_count + 1)
  end

end
