class Helpers
  def self.include?(something, other, case_sensitive=true)
    is_included = false
    
    unless case_sensitive
      something.downcase!
      if other.is_a? String
        other.downcase!
      else
        if other.is_a? Array
          other.collect! {|x| x.downcase }
        end
      end
    end
    
    if other.is_a? String
      is_included = something.include?(other)
    else
      if other.is_a? Array
        other.each do |thing|
          if something.include?(thing)
            is_included = true
          end
        end
      end
    end
   
    is_included
  end
end