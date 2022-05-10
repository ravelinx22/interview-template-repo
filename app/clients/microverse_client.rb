class MicroverseClient
  include Singleton
  HOST_URL = 'microverse-api-app.herokuapp.com'

  # https://microverse-api-app.herokuapp.com/users
  def get_users(args = {})
    uri = URI::HTTP.build(
      host: HOST_URL,
      path: '/users',
      query: args.to_query
    )
    HTTParty.get(
      uri,
      headers: {
        Authorization: ENV['MICROVERSE_API_KEY']
      }
    ).parsed_response
  end
end