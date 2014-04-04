require 'spec_helper'

feature 'add a new owner record', %q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

  scenario 'Successfully registers new owner with valid attributes' do
    pre_count = Owner.count
    visit new_owner_path
  end

end
