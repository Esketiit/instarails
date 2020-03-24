Account.delete_all
Post.delete_all
Follow.delete_all
Like.delete_all
Comment.delete_all

a1 = Account.create(first_name: "Sam", last_name: "Ponce", user_name: "Sam_P", password_digest: "SAMANTHA", email: "samp@hotmail.com", bio: "I have a twin sister")
a2 = Account.create(first_name: "Brian", last_name: "Desplantes", user_name: "ACarMeIn", password_digest: "4202", email: "BD@gmail.com", bio: "I hate beign short")
p1 = Post.create(account: a1, image: "test", description: "first post")
Follow.create(follower: a1, followee: a2)
Follow.create(follower: a2, followee: a1)
Like.create(post: p1, account: a2)
Comment.create(post: p1, account:a2, content: "Yo")
