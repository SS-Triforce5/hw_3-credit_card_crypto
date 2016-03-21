require_relative '../credit_card'
require 'minitest/autorun'

<<<<<<< 9e4ddfc320d78279b3dc39b0551a6349daca77da
# Feel free to replace the contents of cards with data from your own yaml file
card_details = [
  { num: '4916603231464963', exp: 'Mar-30-2020', name: 'Soumya Ray', net: 'Visa' },
  { num: '6011580789725897', exp: 'Sep-30-2020', name: 'Nick Danks', net: 'Visa' },
  { num: '5423661657234057', exp: 'Feb-30-2020', name: 'Lee Chen', net: 'Mastercard' }
]
=======
describe 'Test hashing requirements' do
  before do
    @cc1 = CreditCard.new('4916603231464963',
                          'Mar-30-2020', 'Soumya Ray', 'Visa')
    @cc2 = CreditCard.new('4916603231464963',
                          'Mar-30-2020', 'Soumya Ray', 'Visa')
    @cc3 = CreditCard.new('5423661657234057',
                          'Feb-30-2020', 'Soumya Ray', 'Mastercard')
  end
>>>>>>> rubocup

cards = card_details.map { |c| CreditCard.new(c[:num], c[:exp], c[:name], c[:net]) }
puts cards[0]
describe 'Test hashing requirements' do
  describe 'Test regular hashing' do
    describe 'Check hashes are consistently produced' do
      # TODO: Check that each card produces the same hash if hashed repeatedly
      cards.each { |card| card.to_s.hash.must_equal card.to_s.hash }
    end

    describe 'Check for unique hashes' do
      # TODO: Check that each card produces a different hash than other cards
      cards.combination(2).each { |card_a, card_b| card_a.to_s.hash.wont_equal card_b.to_s.hash }
    end
  end

  describe 'Test cryptographic hashing' do
<<<<<<< 9e4ddfc320d78279b3dc39b0551a6349daca77da
    describe 'Check hashes are consistently produced' do
      # TODO: Check that each card produces the same hash if hashed repeatedly
      cards.each { |card| card.to_s.hash_secure.must_equal card.to_s.hash_secure }
=======
    it 'should find the same hash for identical cards' do
      # TODO: implement this test
      @cc1.hash_secure.wont_be_nil
      @cc2.hash_secure.wont_be_nil
      @cc1.hash_secure.must_equal @cc2.hash_secure
>>>>>>> rubocup
    end

    describe 'Check for unique hashes' do
      # TODO: Check that each card produces a different hash than other cards
      cards.combination(2) { |card_a, card_b| card_a.to_s.hash.wont_equal card_b.to_s.hash }
    end

    describe 'Check regular hash not same as cryptographic hash' do
      # TODO: Check that each card's hash is different from its hash_secure
      cards.each { |card| card.to_s.hash.wont_equal card.to_s.hash_secure }
    end
  end
end
