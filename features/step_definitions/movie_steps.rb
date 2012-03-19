# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
  Movie.create!(movie)
#print Movie.select(:title).where("title = ",movie[:title])
#print Movie.all
#print movie
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
#assert false, "Unimplmemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  assert false, "Unimplmemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(",").each do |cbox|
  #step %Q{I #{uncheck}check "ratings_#{cbox}"} 
  step %Q{I #{uncheck}check "ratings[#{cbox}]"} 
  end
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end

Then /I should see all the movies/ do 
    Movie.all.each do |imovie|
        #print "movie title is: #{imovie.title}"
        #step %Q{I should see "Aladdin"}
        step %Q{I should see "#{imovie[:title]}"}
  end
end

Then /I should see none of the movies/ do 
    Movie.all.each do |imovie|
        #print "movie title is: #{imovie.title}"
        #step %Q{I should see "Aladdin"}
        step %Q{I should not see "#{imovie[:title]}"}
  end
end

