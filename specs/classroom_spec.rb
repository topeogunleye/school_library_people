require_relative '../classroom'
require_relative '../student'

describe 'Test of the classroom' do
  describe '#initialize' do
    it 'should create a new classroom' do
      classroom = Classroom.new('A')
      expect(classroom.label).to eq('A')
    end
  end
end
