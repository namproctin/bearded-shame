# This class trims beards
class BeardTrimmer

  def self.trim(user, length)
    user.beard_length = user.beard_length - length
    user.trimed = true
    user.save
  end

end
