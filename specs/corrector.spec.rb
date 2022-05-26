require_relative '../corrector'

describe 'Test of the corrector class' do
  context 'check instance method' do
    it 'should capitalize the first letter of the title' do
      name = 'victor'
      corrected_name = Corrector.new
      expect(corrected_name.correct_name(name)).to eq('Victor')
    end

    it 'should slice letters after the tenth letter' do
      letters = 'abcdefghijklmnopqrstuvwxyz'
      corrected_name = Corrector.new
      expect(corrected_name.correct_name(letters)).to eq('abcdefghij')
    end

    it 'should return the variable passed unchanged' do
      name = 'victor'
      expect(name).to eq('victor')
    end
  end
end
