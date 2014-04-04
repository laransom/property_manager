require 'spec_helper'

describe Owner do

  it { should have_valid(:first_name).when('John', 'Frank') }
  it { should_not have_valid(:first_name).when( nil, '') }

  it { should have_valid(:last_name).when('Smith', 'Sullivan') }
  it { should_not have_valid(:last_name).when( nil, '') }

  it { should have_valid(:email).when('valid@email.com', 'test@test.com') }
  it { should_not have_valid(:email).when( nil, '', 'bad@net', 'terrible.com', 'words') }




end
