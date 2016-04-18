class RegistrationNumber
  def self.next
    number = random
    Voter.exists?(registration_number: number) ? self.next : number
  end

  private

  def self.random
    SecureRandom.uuid[0..7].upcase
  end
end
