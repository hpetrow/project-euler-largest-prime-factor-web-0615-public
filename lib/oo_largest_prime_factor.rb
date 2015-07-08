# Enter your object-oriented solution here!

class LargestPrimeFactor
  attr_reader :number

  def initialize(n)
    @number = self.largest_prime_factor(n)
  end

  def largest_prime_factor(n)
    primes = []
    prime_factors(n, primes)
    primes.max
  end

  def prime_factors(n, primes)
    factors = tree_factors(n)
    if (factors)
      factors.each{ |factor|
        prime_factors(factor, primes)
      }
    else
      primes << n
    end
  end

  def tree_factors(n)
    factors = nil
    i = Math.sqrt(n).floor

    while i >= 2 && !factors
      if n%i == 0
        factors = [i, n/i]
      end
      i -= 1
    end
    factors
  end
end
