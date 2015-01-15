class AuthorState
  attr_accessor :authors 
  def initialize(session)
    @session = session
    @session[:authors] ||= @session[:authors] = []
    @authors = session[:authors]
  end

  def push(author)
    @session[:authors].push(author)
    if(@authors.length == 3)              #deques first entry from queue since has been two podcasts since last played
      @authors.delete_at(0)
    end
  end
end
