require './lib/bike.rb'

RSpec.describe Bike do
  it { respond_to{:working?} }
end
