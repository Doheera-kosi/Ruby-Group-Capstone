require_relative '../classes/label'

describe Label do
  before :all do
    @label = Label.new('The gods are not to be blame', 'ash')
  end

  context 'when creating a new label' do
    it 'should be an instance of label class' do
      expect(@label).to be_an_instance_of(Label)
    end

    it 'should have a title' do
      expect(@label.title).to eq('The gods are not to be blame')
    end

    it 'should have a color' do
      expect(@label.color).to eq('ash')
    end

    it 'has add_item method' do
      expect(@label).to respond_to(:add_item)
    end
  end
end
