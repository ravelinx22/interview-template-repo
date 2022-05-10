class MicroverseUser
  attr_accessor :id
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :status
  attr_accessor :created_at
  attr_accessor :email

  def initialize(
    id:, first_name:, last_name:,
    status:, created_at:, email: 
  )
    @id = id
    @first_name = first_name
    @last_name = last_name
    @status = status
    @created_at = created_at
    @email = email
  end

  def to_h
    instance_values    
  end

  class << self
    def from_json_array(jsonArray)
      jsonArray.map{ |user| MicroverseUser.from_json_object(user) }
    end

    def from_json_object(json)
      MicroverseUser.new(
        id: json['id'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        status: json['status'],
        created_at: json['created_at'],
        email: json['email']
      )
    end
  end
end