# Requirements
* Ruby 3.2.0
* Bundler

# How to run
1) Run `bundle install`
2) Alter the `meetings` variable in `runme.rb` and then run it as you would any other Ruby script: `ruby runme.rb`.
3) Run tests with `bundle exec rspec spec`

# Potential questions answered
* Do you need Time?
We all need Time, the more the better. Oh, you are asking about the code. The answer is -- it depends.
If we make the assumption that the input passed in will only ever be 0.50 of an hour or 1 hour, then you could use a simple float which you would then stringify and format as appropriate. That assumption, however, is not an assumption I would ever consider.
Fat fingering is a thing (source: me). The input could end up with a time span of 0.26 or 0.76. You then have a mess as 60 * 0.26 = 15.6 and the question becomes "what do we do with the 0.6?"
* Why a service class?
Force of habit, I suppose. For something like this that does one thing, and one thing only, a service class makes sense. I know there is a lot of debate within the Ruby and the Rails community about service classes, but I don't usually listen to that hub-bub.
* Does 12/13/2021 have any meaning?
Interesting question, and one I didn't think you would ask.
12/13/2021 is the day the judge signed off on my son's adoption.
* Why so few tests?
Because testing STDOUT is a right pain. Could I have introduced exceptions if a meeting didn't fit, and then test against that? Sure, but that adds unneeded complexity which leads to tech debt.
The only tests I wrote are those tests that are necessary because I can be an idiot at times. I always forget how sort works in terms of which elem needs to be in front of the `<=>` and which needs to come after. Also, the test just proves that my code isn't borked in a more deep way.
* Are you a TDD developer?
In general, yes. I do understand when it wouldn't make sense to do TDD (spiking, like this type of a project being one time) but I like seeing tests on PRs. Actually, I expect tests on PRs. I don't care if you do them before, or after, they just better be there and cover what I would expect.
* Do you have a CompSci degree that you neglected from your resume?
No. I am a self-taught developer. I have degrees in Music, but that is about as far from development as you can get.
* What did you think of this test?
I enjoyed it. It seems simple on the surface, but as you dig it gets a bit more complex. Plus, it's not "leetcode" which is something I absolutely loathe.
* Do you bless the rains down in Africa?
Yes. Fun fact: that song is not hated by Kenyans, at least Kenyans I spoke to about the song. To be fair my sample size is... four out of the fifty-three-million Kenyans, so it may be an inaccurate stateent.
* Where do you get such wonderful hair?
Contrary to popular speculation, it's not Maybeline. I'm just born with it.
* Why isn't there an adorable gif included in this README?
I couldn't think of one that fits the subject-matter. Don't worry, my PRs include gifs.
* Why are you answering questions that have not been asked?
To save time. You don't have to ask the questions as they are already answered. 

In all seriousness: Thanks for the opportunity, and the leniency. This was a fun way to kill a couple of hours of time (may be more than a couple of hours).

PS: I lied about the Gif. Have a hyena splashing in the water.


![giphy](https://user-images.githubusercontent.com/6898085/218318618-bdb16c9e-eee1-462d-8bac-0d6cfadc4fe6.gif)
