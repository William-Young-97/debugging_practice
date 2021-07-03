def factorial(n)
     product = 1
    while n > 0
      product *= n
      n -= 1
    end
    p product
  end
  
  # Intended output:
  #
  factorial(5)
  # => 120
  