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
    context 'given something other than a string' do
      before(:each) do
        @name = []
        @result = @greeter.greet_by_name @name
      end
      it 'returns a string' do
        expect(@result.class).to be(String)
      end
      it 'falls back to 0 argument greet method' do
        expect(@result).to eq(@greeter.greet)
      end
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

  describe 'Greeter#greet_as' do
    context 'given no options' do
      it 'falls back to 1 argument greet_by_name method' do
        expect(@greeter.greet_as('', nil)).to eq(@greeter.greet_by_name '')
        expect(@greeter.greet_as('Bob', nil)).to eq(@greeter.greet_by_name 'Bob')
      end
    end
    context 'given a nil style' do
      it 'falls back to 1 argument greet_by_name method' do
        expect(@greeter.greet_as('', as: nil)).to eq(@greeter.greet_by_name '')
        expect(@greeter.greet_as('Bob', as: nil)).to eq(@greeter.greet_by_name 'Bob')
      end
    end
    context 'given an empty string' do
      before(:each) do
        @name = ''
      end
      it 'returns a string' do
        @style = nil
        @result = @greeter.greet_as(@name, as: @style)
        expect(@result.class).to be(String)
      end
      context 'given a nil style' do
        it 'falls back to 0 argument greet method' do
          @style = nil
          @result = @greeter.greet_as(@name, as: @style)
          expect(@result).to eq(@greeter.greet)
        end
      end
      context 'given an unknown style' do
        it 'falls back to 0 argument greet method' do
          @style = :zyx1
          @result = @greeter.greet_as(@name, as: @style)
          expect(@result).to eq(@greeter.greet)
        end
      end
      context 'given a known style' do
        it 'displays a styled anonymous greeting' do
          @style = :pirate
          @result = @greeter.greet_as @name, as: @style
          expect(@result).to eq("Yar! Ahoy!")
          @style = :victorian
          @result = @greeter.greet_as @name, as: @style
          expect(@result).to eq("Ever so delightful to meet thee!")
          @style = :aussie
          @result = @greeter.greet_as @name, as: @style
          expect(@result).to eq("G'day!")
        end
      end
    end
    context 'given a name' do
      before(:each) do
        @name = 'Alice'
      end
      context 'given an unknown style' do
        it 'falls back to 1 argument greet_by_name method' do
          @style = :zyx1
          @result = @greeter.greet_as(@name, as: @style)
          expect(@result).to eq(@greeter.greet_by_name @name)
        end
      end
      context 'given a known style' do
        it 'displays a styled greeting with the name' do
          @style = :pirate
          @result = @greeter.greet_as @name, as: @style
          expect(@result).to eq("Yar! Ahoy, #{@name}!")
          @style = :victorian
          @result = @greeter.greet_as @name, as: @style
          expect(@result).to eq("Ever so delightful to meet thee, #{@name}!")
          @style = :aussie
          @result = @greeter.greet_as @name, as: @style
          expect(@result).to eq("G'day, #{@name}!")
        end
      end
    end
  end
end