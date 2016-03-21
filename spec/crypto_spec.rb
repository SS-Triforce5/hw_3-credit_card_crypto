require_relative '../credit_card'
require_relative '../substitution_cipher'
require_relative '../double_trans_cipher'
require_relative '../aes_cipher'
require 'minitest/autorun'

describe 'Test card info encryption' do
  before do
    @cc = CreditCard.new('4916603231464963',
                         'Mar-30-2020', 'Soumya Ray', 'Visa').to_s
    @key = 3
  end
  # TODO: Add tests for double transposition and AES ciphers
  #       Can you DRY out the tests using metaprogramming? (see lecture slide)
  ciphers = [
    ['Caesar cipher', SubstitutionCipher::Caesar],
    ['Permutation cipher', SubstitutionCipher::Permutation],
    ['Double transposition cipher', DoubleTranspositionCipher],
    ['AES cipher', AesCipher]
  ]
  ciphers.each do |name, method|
    describe 'Using #{name}' do
      it 'should encrypt card information' do
        enc = method.encrypt(@cc, @key)
        enc.wont_equal @cc.to_s
        enc.wont_be_nil
      end

      it 'should decrypt text' do
        enc = method.encrypt(@cc, @key)
        dec = method.decrypt(enc, @key)
        dec.must_equal @cc.to_s
      end
    end
  end
end
