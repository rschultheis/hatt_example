require 'hatt'

RSpec.configure do |config|

  config.include Hatt::SingletonMixin

  config.before(:all) do
    hatt_initialize
  end
end
