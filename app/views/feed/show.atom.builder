atom_feed do |feed|
  
  feed.title "blog.mpa.fi"
  feed.subtitle "tech notes"
  
  feed.updated @posts.first.updated_at 

  @posts.each do |post|
    feed.entry(post, :published => post.published_at) do |entry|
      entry.title post.topic
      entry.content post.body, :type => 'html'
            
      entry.author do |author|
        author.name("Matti")
      end
    end

  end

end