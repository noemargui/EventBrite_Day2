require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @event = FactoryBot.create(:event)
  end

  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end

  describe "#start_date" do
    it { expect(@event).to validate_presence_of(:start_date) }
  end

  describe "#duration" do
    it { expect(@event).to validate_presence_of(:duration) }
    it { expect(@event.duration % 5).to be( 0 ) }
    it { is_expected.to allow_value(25).for(:duration) }
    it { is_expected.to_not allow_value(2.5).for(:duration) }
    it { is_expected.to_not allow_value(-5).for(:duration) }
    it { is_expected.to_not allow_value(0).for(:duration) }
  end

  describe "#title" do
    it { expect(@event).to validate_presence_of(:title) }
    it { is_expected.to_not allow_value(Faker::Lorem.characters(141)).for(:title) }
    it { expect(@event).to validate_length_of(:title).is_at_least(5) }
  end

  describe "#description" do
    it { expect(@event).to validate_presence_of(:description) }
    it { is_expected.to_not allow_value(Faker::Lorem.characters(1001)).for(:description) }
    it { expect(@event).to validate_length_of(:description).is_at_least(20) }
  end

  describe "#price" do
    it { expect(@event).to validate_presence_of(:price) }
    it { is_expected.to_not allow_value(Faker::Number.number(4)).for(:price) }
    it { expect(@event).to validate_numericality_of(:price).is_greater_than_or_equal_to(1) }
  end

  describe "#location" do
    it { expect(@event).to validate_presence_of(:location) }
  end

  context "associations" do
    it { should belong_to(:admin).class_name("User")}
    it { should have_many(:attendances)}
    it { should have_many(:attendees).class_name("User").through(:attendances)}
  end


end

