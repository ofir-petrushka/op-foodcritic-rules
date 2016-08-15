# frozen_string_literal: true
require 'spec_helper'

describe 'OP001' do
  let(:fc_run) do
    foodcritic_run('OP001')
  end

  it 'generates a warning against untested recipe' do
    expect(warnings(fc_run)).to include('untested.rb')
  end

  it 'doesn\'t generate a warning against tested recipe' do
    expect(warnings(fc_run)).to_not include('tested.rb')
  end

  it 'doesn\'t generate a warning against test_includes recipe' do
    expect(warnings(fc_run)).to_not include('test_includes.rb')
  end

  it 'doesn\'t generate a warning against tested_by_include recipes' do
    expect(warnings(fc_run)).to_not include('tested_by_include_single_quotes.rb')
    expect(warnings(fc_run)).to_not include('tested_by_include_double_quotes.rb')
  end
end
