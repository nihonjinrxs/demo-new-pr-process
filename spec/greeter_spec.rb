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
  describe 'Greeter#greet_by_name' do
    before(:each) do
      @name = ''
      @result = @greeter.greet_by_name @name
    end
    it 'returns a string' do
      expect(@result.class).to be(String)
    end
    it 'falls back to the 0 argument greet method' do
      expect(@result).to eq(@greeter.greet)
    end
    context 'given a name' do
      before(:each) do
        @name = 'Bob'
        @result = @greeter.greet_by_name @name
      end
      it 'returns a string' do
        expect(@result.class).to be(String)
      end
      it 'greets the user by name' do
        expect(@result).to eq("Hello, #{@name}!")
      end
    end
  end
end