class AttrAccessorObject
  def self.my_attr_accessor(*names)
    
    names.each do |name|
      #getter
      define_method(name) do
        instance_variable_get("@#{name}")
      end

      #setter
      setter = (name.to_s + '=')
      define_method(setter) do
        |new_ele|
        instance_variable_set("@#{name}", new_ele)
      end

    end
  end
end
