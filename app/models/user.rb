require "#{Rails.root}/lib/beard_trimmer.rb"
require "#{Rails.root}/lib/beard_trimmer/with_massage.rb"
require "#{Rails.root}/lib/beard_shaver.rb"

class User < ActiveRecord::Base
  validates :beard_length, :numericality => { :greater_than_or_equal_to => 0 }

  def fullname
    first_name + " " + last_name
  end

  def validate_trim_length(length,user)
    if length.to_i.to_s == length.to_s && user.beard_length > length.to_i && length.to_i > 0
      true
    else
      false
    end
  end

  def trimming(length)
    if validate_trim_length(length,self)
      BeardTrimmer.trim(self,length.to_i)
      "ok"
    else
      "fail"
    end
  end

  def massaging_and_trimming(length,type)
    if validate_trim_length(length,self)
      BeardTrimmer::WithMassage.trim(self,length.to_i,type)
      "ok"
    else
      "fail"
    end
  end

  def shaving
    BeardShaver.shave(self)
  end
end
