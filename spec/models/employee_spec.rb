require "rails_helper"

describe Employee do
  context "associations" do
    it {should have_one(:manager)}
  end
end
