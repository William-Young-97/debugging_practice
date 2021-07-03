def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  ciphertext_chars = plaintext.chars.map do |char|
    ( 65 + cipher.find_index(char)).chr
  end
  p ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
   plaintext_chars = ciphertext.chars.map do |char|
   cipher[char.ord - 65]
  end
  p plaintext_chars.join
end

encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"

decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# "theswiftfoxjumpedoverthelazydog"

# Problems that we can see

#1 find_index returns nil
#2 Range was exclusive instead of inclusive
#3 Decode goes from position in cipher (Hard to get visbility)

# Solution
#1 Tightened to line 4. Gained visbility by printing around.
# Noticied a nil and tightened to e or z.
# Included z in range. Did same for decode.

#2 Tightened to line 12. Knew that it had to be the reverse of encode (line 4).
# So we subtracted 65 after instead of before