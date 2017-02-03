require "rails_helper"

describe Booking do
  it { is_expected.to validate_presence_of(:check_in)}
  it { is_expected.to validate_presence_of(:check_out)}
  it { is_expected.to validate_presence_of(:first_name)}
  it { is_expected.to validate_presence_of(:last_name)}
  it { is_expected.to validate_presence_of(:title)}
  it { is_expected.to validate_presence_of(:phone)}
  it { is_expected.to validate_presence_of(:email)}
  it { is_expected.to validate_presence_of(:street_name)}
  it { is_expected.to validate_presence_of(:street_number)}
  it { is_expected.to validate_presence_of(:zip_code)}
  it { is_expected.to validate_presence_of(:city)}
  it { is_expected.to validate_presence_of(:people)}
  it { is_expected.to validate_presence_of(:paid)}
  it { is_expected.to validate_presence_of(:total_price)}

  describe "validations" do
    it "has a working factory" do
      let(:new_booking) {build :booking }
      new_booking.valid?
      expect(room.errors).not_to have_key(:room)
    end
  end
end
