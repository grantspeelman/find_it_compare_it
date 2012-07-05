FactoryGirl.define do
  to_create do |instance|
    instance.save ||
        raise(instance.errors.send(:errors).map{|attr,errors| "- #{attr}: #{errors}" }.join("\n"))
  end
end