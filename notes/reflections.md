# Reflections
## Why I read this book
I started reading this book because I had found out that it would be partly used for my first CS course at uWaterloo (CS 145). I'll admit that it was partly to try to "get ahead", but I knew that it wouldn't have helped much since the course only loosely follows the book, and in some ways, self-studying might be detrimental as you learn incorrect ways without an instructor to correct you. I was more curious with functional programming - I had heard about (but never used) various functional programming languages like Lisp, Scala, Ocaml, Haskell, etc, and I thought that this is finally the time to learn about them. I knew that functional programming languages were quite different to the imperative programming languages that I had grown very comfortable with, and I was interested in gaining a new perspective on computing.

I was also just interested in becoming a better programmer in general, and a systematic approach to building software appealed to me. I liked that following the Design Recipe forces the reader to write good documentation. Heres a quote from the summary of part one: 
> A good programmer designs programs. A bad programmer tinkers until the program seems to work.

Unfortunately, I find myself guilty of being a "bad programmer" by this definition sometimes. Sure, I can build however many side projects I like, but I'm not really building my skills if I'm writing undocumented spaghetti code that even my own self would get confused if I read it a week later. I hope that this book furthered my abilities in these aspects.

## What  I learned
- Document your code. Specifically: state the purpose of the function, what valid inputs it takes in and what outputs it produces, and provide examples of the function in use. This helps not only other people but your future self who may revisit this code later.

- Make test cases for the functions (or any piece of code) that you write, i.e. for a given input, state what output your function should produce. In Racket, the `check-expect` function was used a lot for testing.

- I finally learned recursion in depth, something that I had always avoided out of fear ever since I learned programming. The only way that I truly understood this concept was through completing many exercises, which the book provides many of.


## What I created
- Defining the addition and multiplication operators on the natural numbers using a recursive function involving the successor and predecessor