require "rails_helper"

describe Team do
  context "associations" do
    it {should have_many(:employees)}
  end
end
