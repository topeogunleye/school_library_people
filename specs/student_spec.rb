require_relative '../student'

describe Student do
  context 'Testing the Student class' do
    student = Student.new(22, 'Anuar', parent_permission: true)

    it 'has the class of Student' do
      expect(student.instance_of?(Student)) == true
    end
  end
end
