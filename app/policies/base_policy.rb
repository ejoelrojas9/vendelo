class BasePolicy
  attr_reader :record
  
  def initialize(record)
    @record = record
  end

  def method_missing(m, *args, &block)    # Metodo que se ejecuta cuando no se encuentra el metodo que se llama
    false
  end

end