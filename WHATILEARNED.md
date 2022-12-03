# What I Learned

It's been a while since I have seriously coded and I lost all my knowledge in a bubble so that is why I tried AOC again.

With a bunch of people who are better than me, I can finally see what possible solutions are that are better than mine, *and they are usually better than mine's*.

## Day 1

Pretty sure some have solutions with fewer lines in Julia but so far it's not a big of a deal for me.

## Day 2

I just use a very hacky script on this one and it's very spaghetti... oh well. 

I could have used structs for this one to create an hierarchy of types so I could create functions that can easily solve this problem. 

But because I have not studied very well about Julia's type system, I realize I didn't use the language most powerful feature, **Multiple Dispatch**. 

Solutions from [Lazaro](https://github.com/lazarusA/AdventOfCode2022/blob/master/src/day2.jl) and [Dzonimn](https://gist.github.com/dzonimn/6f015f0294c1c3e97f931ed71a09d48b) helped me realize how powerful they are and its not even using its full power.

## Day 3

Although the type system and multiple dispatch is powerful, it does not mean you should use them all the time. My solution was me trying to understand types and multiple dispatch, but kind of failed because I am pretty sure I didn't do it properly.

Anyway, I also forget that there are many existing built-in functions in Julia and one powerful function would be `intersect` for this. Some peeps used this and only made 10 LoC for both part 1 and 2 in Julia.

