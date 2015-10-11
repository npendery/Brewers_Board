require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it { should belong_to :user }

  it { should have_valid(:name).when('Recipe Name', 'Big Hopper') }
  it { should_not have_valid(:name).when('', nil) }

  it { should have_valid(:description).when('this is really good stuff') }
  it { should_not have_valid(:description).when('', nil) }

  it { should have_valid(:ingredients).when('description') }
  it { should_not have_valid(:ingredients).when('', nil) }

  it { should have_valid(:instructions).when('description') }
  it { should_not have_valid(:instructions).when('', nil) }

  it { should have_valid(:style).when('India Pale Ale') }
  it { should_not have_valid(:style).when('', nil) }

  it { should have_valid(:yielder).when('description') }
  it { should_not have_valid(:yielder).when('', nil) }

  context 'uniqueness' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:recipe) { FactoryGirl.create(:recipe, user: user) }
    let!(:recipe_2) { FactoryGirl.create(:recipe, user: user) }

    it 'requires a unique name' do
      recipe_2.name = recipe.name
      expect(recipe_2).to_not be_valid
      expect(recipe_2.errors[:name]).to_not be_empty
    end
  end

  # describe "#average_rating" do
  #   it "it averages the score for each review" do
  #     review = FactoryGirl.create(:review)
  #     user1 = FactoryGirl.create(:user)
  #     user2 = FactoryGirl.create(:user)
  #     FactoryGirl.create(:vote, user: user1, review: review)
  #     FactoryGirl.create(:vote, user: user2, review: review)
  #
  #     expect(review.total_score).to eq(2)
  #   end
  # end
end
