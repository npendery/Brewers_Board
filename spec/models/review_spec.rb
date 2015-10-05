require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to :user }
  it { should belong_to :recipe }

  it { should have_valid(:rating).when(1) }
  it { should_not have_valid(:rating).when('', nil) }

  it { should have_valid(:title).when('yuk') }
  it { should_not have_valid(:title).when('', nil) }
end
