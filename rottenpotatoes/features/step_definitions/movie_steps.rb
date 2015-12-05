Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(title: movie['title'], rating: movie['rating'], release_date: movie['release_date'], director: movie['director'] )
  end
end

Then /^the director of "(.*)" should be "(.*)"/ do |movie_title, director_name|
  expect(Movie.find_by_title(movie_title).director).to be == director_name
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  is_before = !!(/(.*)?#{e1}(.*)?#{e2}(.*)/m.match page.body)
  is_before.should == true
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  f = rating_list.split(',').map {|s| s.strip}
  f.each do |r|
    step "I #{uncheck}check \"ratings[#{r}]\""
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  db_movies_n = Movie.all.length
  db_movies_n.should == (page.all('#movies tr').length - 1)
end
