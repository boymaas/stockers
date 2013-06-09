require 'spec_helper'

describe Stockers do
  it 'should have a version number' do
    Stockers::VERSION.should_not be_nil
  end
end
