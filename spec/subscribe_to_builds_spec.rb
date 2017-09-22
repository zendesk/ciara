require 'rspec'

describe 'Subscribe to the builds topic' do

  context 'The build topic is available' do
    before do
      # set up the topic and subscriptions
    end

    it 'find the topic' do
      expect(true).to eql(false)
    end

    it 'find the subscription' do
      expect(true).to eql(false)
    end

    it 'if it cannont find the subscription it should create one' do
      expect(true).to eql(false)
    end

    it 'get the subscription' do
      expect(true).to eql(false)
    end
  end

  context 'The build topic is not available' do
    before do
      # check if the topic is available if it is remove it
    end

    it 'should not find the topic' do
      expect(true).to eql(false)
    end

    it 'should alert (TBD) that the topic cannot be found' do
      expect(true).to eql(false)
      #TODO: decide on the type of alterting is appropriate
      # let(:alter_channel) {be something}
    end

  end

end
