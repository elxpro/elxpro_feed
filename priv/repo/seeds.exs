alias ElxproFeed.Feeds.Feed
alias ElxproFeed.Repo

content = "hi
==

  Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eius facilis doloremque fugit.!!!

  Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eius facilis doloremque fugit.!!!

  Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eius facilis doloremque fugit.!!!

  [elxpro/gustavo](https://www.linkedin.com/in/gustavo-oliveira-642b23aa/)"

feed_1 = %{
  content: content,
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
  content: content,
  role: "Principal Engineer",
  avatar_url: "https://avatars.githubusercontent.com/u/12762300?v=4",
  author: "Joe Morris"
}

%Feed{}
|> Feed.changeset(feed_2)
|> Repo.insert()
