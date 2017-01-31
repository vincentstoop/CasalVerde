require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "name validations" do
    it "is invalid with a long name" do
      review = Review.new(name: "JWIOjiojiojiojiojiojwjoewioirhonoiqjoiwhjoiqhoifhqweoirheoihfoieqhfoiqhoihfoineqoinfoiqenfoiqehiofhqeoihfeioqhfioqehoiqehiofhqoifhoiqehionqioenion")
    end
  end
end
