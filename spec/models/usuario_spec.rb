# encoding: utf-8

require 'spec_helper'

describe Usuario do
  
  it { should have_db_column(:nome).of_type(:string) }
  it { should have_db_column(:tipo_sanguineo).of_type(:string) }
  it { should have_db_column(:fator_rh).of_type(:string) }
  
  it { should validate_presence_of(:nome) }
  
  %w(+ -).each do |valor|
    it { should allow_value(valor).for(:fator_rh) }
  end
  
  %w(A B AB O).each do |valor|
    it { should allow_value(valor).for(:tipo_sanguineo)}
  end
  
  describe 'quando existir um usuário cadastrado' do
    before do
      Usuario.new(email: 'test@example.com').save(validate: false)
    end
    
    it { should validate_uniqueness_of(:email) }
  end
  
end
