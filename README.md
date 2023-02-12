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
You could use simple floats for this code. You would have a `start_time` of `9` and an `end_time` of `17`. You could then take the duration of each event and add it the `current_time` which at the start would be `9`. It would be the same logic as I am currently using from there.

The question then becomes "how do you get a human readable time?" Suppose an event goes from `9` to `10.5`. How do you get a human readable time format? Well, `9` is easy. It's 9 AM. `10.5` is a bit trickier. You would have to take that `.5`, say "okay, this is 30 minutes past" then build the string `10:30 AM`. Not too terrible, until... reality comes in.

What if a meeting is `1.35` hours? What's `0.35` of an hour? Is it 35 minutes past, or is it 21 minutes past (`60 * 0.35`)? You can set rules, but rules rarely, in my experience, get followed.

Times get messy, and while you can use floats to represent time spans, using floats/integers to specify a specific time is frought with edge cases that you may not ever consider until you hit one.

* Why a service class?

Force of habit, I suppose. For something like this that does one thing, and one thing only, a service class makes sense. I know there is a lot of debate within the Ruby and the Rails community about service classes, but I don't usually listen to that hub-bub.

* Does 12/13/2021 have any meaning?

Interesting question, and one I didn't think you would ask.
12/13/2021 is the day the judge signed off on my son's adoption.

* Are you a TDD developer?

In general, yes. I do understand when it wouldn't make sense to do TDD (spiking, like this type of a project being one time) but I like seeing tests on PRs. Actually, I expect tests on PRs. I don't care if you do them before, or after, they just better be there and cover what I would expect.

* Do you have a CompSci degree that you neglected from your resume?

No. I am a self-taught developer. I have degrees in Music, but that is about as far from development as you can get.

* What did you think of this test?

I enjoyed it. It seems simple on the surface, but as you dig it gets a bit more complex. Plus, it's not "leetcode" which is something I absolutely loathe.

* Do you bless the rains down in Africa?

Yes. Fun fact: that song is not hated by Kenyans, at least Kenyans I spoke to about the song. To be fair my sample size is... four out of the fifty-three-million Kenyans, so it may be an inaccurate stateent.

* Where do you get such wonderful hair?

Contrary to popular belief, it's not Maybeline. I'm just born with it.

* Why isn't there an adorable gif included in this README?

I couldn't think of one that fits the subject-matter. Don't worry, my PRs include gifs.

* Why are you answering questions that have not been asked?

To save time. You don't have to ask the questions as they are already answered. 

In all seriousness: Thanks for the opportunity, and the leniency. This was a fun way to kill a couple of hours of time (may be more than a couple of hours).

PS: I lied about the Gif. Have a hyena splashing in the water.


![giphy](https://user-images.githubusercontent.com/6898085/218318618-bdb16c9e-eee1-462d-8bac-0d6cfadc4fe6.gif)
