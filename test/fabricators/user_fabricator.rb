Fabricator(:user) do
  email { sequence(:email) { |i| "user#{i}@gmail.com" } }
end
