require 'spec_helper'

describe Building do

  it { should have_valid(:address).when('12 This Rd') }
  it { should_not have_valid(:address).when(nil, '') }

  it { should have_valid(:city).when('New York City') }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when('New York') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:zip_code).when('12344', '54685') }
  it { should_not have_valid(:zip_code).when(nil, '', 'hello', '123567') }

end
