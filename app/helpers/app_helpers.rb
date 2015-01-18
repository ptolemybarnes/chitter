class Hash

  def symbolize_keys
    self.map {|k, v| [k.to_sym, v]}.to_h
  end

end