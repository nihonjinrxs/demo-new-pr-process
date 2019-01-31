require('./lib/greeter')

describe Greeter do
  before(:all) do
    @greeter = Greeter.new
  end

  describe 'Greeter#greet' do
    it 'returns a string' do
      expect(@greeter.greet.class).to be(String)
    end
    it 'returns a friendly greeting' do
      expect(@greeter.greet).to eq('Hello!')
    end
  end
end