class Author
  
    def initialize(first_name, last_name, id = Random.rand(10_000))
      @first_name = first_name
      @last_name = last_name
      @id = id
      @items = []
    end