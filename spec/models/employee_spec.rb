require "rails_helper"

describe Employee do
  context "associations" do
    it {should have_one(:manager)}
    it {should have_many(:reviews)}
  end
end
