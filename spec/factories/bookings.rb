FactoryGirl.define do
  factory :booking do
    check_in        DateTime.now
    check_out       10.days.from_now
    first_name      "John"
    last_name       "Doe"
    title           "mr"
    phone           1234567890
    email           {"#{first_name}.#{last_name}@example.com".downcase }
    street_name     "Singel"
    street_number   "450B"
    city            "Amsterdam"
    zip_code        "3534AA"
    people           8
    total_price      10.20
    confimed         false
    paid             false
  end
end
