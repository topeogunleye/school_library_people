require_relative '../person'

describe 'Test of the corrector class' do
  context 'check instance method' do
    it 'should create a new Person' do
      person = Person.new(20, 'John Doe')
      expect(person.name).to eq('John Doe')
    end

    it 'should check if can_use_services?' do
      person = Person.new(20, 'John Doe')
      expect(person.can_use_services?).to eq(true)
    end
  end
end
