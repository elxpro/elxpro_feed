alias ElxproFeed.Feeds.Feed
alias ElxproFeed.Repo

feed_1 = %{
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas eius asperiores harum.

    Lorem ipsum, dolor sit amet consectetur adipisicing elit. Iste nesciunt exercitationem velit.

    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eum velit sapiente repellendus.

    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore incidunt est nostrum.

    [elxpro/gustavo](https://www.linkedin.com/in/gustavo-oliveira-642b23aa/)
  ",
  avatar_url: "https://avatars.githubusercontent.com/u/12762300?v=4",
  role: "Software Engineer",
  author: "Gustavo Oliveira"
}

{:ok, feed} =
  %Feed{}
  |> Feed.changeset(feed_1)
  |> Repo.insert()

ElxproFeed.Comments.create_comment(%{content: "hi!!!", feed_id: feed.id})

feed_2 = %{
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas eius asperiores harum.

    Lorem ipsum, dolor sit amet consectetur adipisicing elit. Iste nesciunt exercitationem velit.

    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eum velit sapiente repellendus.

    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore incidunt est nostrum.

    [elxpro/joe]https://www.linkedin.com/in/joedmorris/)
  ",
  role: "Principal Engineer",
  avatar_url: "https://avatars.githubusercontent.com/u/12762300?v=4",
  author: "Joe Morris"
}

%Feed{}
|> Feed.changeset(feed_2)
|> Repo.insert()
