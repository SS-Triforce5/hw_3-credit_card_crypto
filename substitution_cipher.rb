module SubstitutionCipher
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher

      ciphertext = document.to_s.chars.map do |ch|
        ch.ord + key > 126 ? (ch.ord + key - 95).chr : (ch.ord + key).chr
      end.join
      ciphertext
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
      ciphertext = document.to_s.chars.map do |ch|
        ch.ord - key < 32 ? ((ch.ord - key) + 95).chr : (ch.ord - key).chr
      end.join
      ciphertext
    end
  end

  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
      permutation_table = Array(0..127).shuffle(random: Random.new(key))
      # create the permutation table
      document.to_s.each_byte.map { |c| permutation_table[c].chr }.join
      # encrypt the document according to the permutation table
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
      permutation_table = Array(0..127).shuffle(random: Random.new(key))
      # create the permutation table
      document.to_s.each_byte.map { |c| permutation_table.index(c).chr }.join
      # decrypt the real value according to the index
    end
  end
end
