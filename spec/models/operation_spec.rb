require 'rails_helper'

RSpec.describe Operation, type: :model do
  context 'Instance of a Operation' do
    it 'Expect to be an instance of Operation' do
      operation = Operation.new
      expect(operation).to be_an_instance_of(Operation)
    end
  end

  context 'with invalid params' do
    it 'Should not be a valid operation with no params' do
      operation = Operation.new
      expect(operation).to_not be_valid
    end

    it 'Should not be a valid operation with 1 param' do
      operation = Operation.new
      operation.name = 'buy a computer'
      expect(operation).to_not be_valid
    end

    it 'Should not be a valid operation with 1 param' do
      operation = Operation.new
      operation.amount = 250
      expect(operation).to_not be_valid
    end
  end

  context 'with Valid params' do
    it 'Should save a new operation wit valid params' do
      user = User.new
      user.name = 'Gra'
      user.email = 'gracianomanuelhenrique@gmail.com'
      user.password = '12345'
      user.save

      operation = Operation.new
      operation.name = 'buy a computer'
      operation.amount = 250
      operation.author = user
      expect(operation).to be_valid
    end
  end

  context 'Object should contain methods' do
    it 'Should have the methods {:name,:amount,:created_at} ' do
      operation = Operation.new
      operation.name = 'computer'
      operation.amount = 250
      expect(operation).to respond_to(:name, :amount, :created_at)
    end
  end

  describe 'Associations' do
    it { should belong_to(:author) }
  end
end
