user = User.create!(name: "Mike", username: "MikeMMM", password: "testing123")

topictest = Topic.create!(user_id: 1, title:"Nathan Hale", description: "Revolutionary war spy who was caught and hanged", category: "History")

commenttest = Comment.create!(topic_id: 1, user_id: 1, content: "testing comments")

athlete = Athlete.create!(user_id: 1, name: "Derek Jeter", description: "Yankees SS", birthdate: "1974-04-26")