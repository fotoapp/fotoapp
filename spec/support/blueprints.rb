require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

User.blueprint do
  username { "user_#{sn}" }
  name     { "User #{sn}" }
  email    { "user#{sn}@foo.com" }
  provider { "github" }
  uid      { "#{sn}" }
  token    { "#{sn}" }
end
