a1 = Account.create(first_name: "Sam", last_name: "Ponce", user_name: "Sam_P", password_digest: "SAMANTHA", email: "samp@hotmail.com")
Post.create(account_id: a1.id, image: "test", description: "first post")
