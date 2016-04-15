require "rails_helper"

describe Manager do

  context "associations" do
    it {should belong_to(:organization)}
  end

end
