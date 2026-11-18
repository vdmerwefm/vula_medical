### Vula Medical Cli:
## Installation instructions:
- The simplest way to run the app is to install the flutter sdk
- got to https://docs.flutter.dev/install/archive
- select your OS and find flutter 3.35.0
- for macOS : download the arm64 Architcture
- for Windows: all versions are x64 Architecture
- follow installation instructions on https://docs.flutter.dev/install/manual specific to your machine.
- copy the file from the repo into your `Documents` folder
- open terminal or cmd

- cd to the folder `cd <path to file>/vula_medical/vula_dart_cli`
- run `dart pub get` all dependencies should resolve quite quickly
- run `dart run` this will trigger the cli and build the output
- output will display as:
```
Most Popular Color is:
------------------
Thistle
------------------
Voucher Winners Are:
------------------
7 Alisha,Patel
------------------
191 Kevin,Moore
------------------
349 Jordan,Garcia
------------------
continued from here...
```
- outputs the most voted color
- outputs users who voted for it in ID order

- tests are grouped, there are 4 of them 
- run `dart test` in terminal and tests will trigger and run 
- output will be displayed as:
```
00:00 +4: All tests passed! 
```
## And thats it, pure dart, no flutter! it was fun

### NOTE: to run this application you will not need the full flutter setup, verifying your dart --version means the application can run

### Assumptions:
- Initially I read the brief and assumed I would just build a simple web application
- Reading the instructions more carefully I realized the actual ask was language specific
- because flutter and dart as usually packaged together the mind determines flutter as internal
- This isnt actually true, Dart is a C based langauge on its own, lack of flutter imports actually complicates things a little

### Decisions:
- I opted to go pure dart with a cli
- This made it so that the task could be executed more easily
- It also meant that third parties libraries would be messy to use
- I decided to rely mainly on loops as they are lightweight
- I also opted for more verbose code, this does make it more lenghty, however from experience it also means the code is more easily read on multiple levels of work, from my work with juniors, intermediates and senior level staff the readability was generally a win and made review easier to perform

### Areas that were unclear which i would ask about:
- I didnt know what format the data would be in, and intially assumed both txt files had the same formatting...i was wrong but that was fun
- I would ask why we are storing the users and votes as two separate files, its ineffiecient as I then had to combine them, so in a work scenario thats where I would push back,
- the brief asks for the users in a ID order, thats a little odd, I would likely ask a PM why an order outside of alphabetical is being selected since I usually look for my name and M or V is easier to scan for
- Additionally I would likely ask if the name or surname takes preference, that would significantly change the winners circle approach beyond just sorting
- I also opted for cli becuase the upload was predictable its a static list, its not going to change, I would likely ask a PM if this is going to be reused as that would alter how we handle the data at entry, still possible though 

### Why Dart: 
- Simply put I love it
- I've been working with it for years
- Its lightweight when it comes to data processing
- It's fast and easy to follow 
- it's tied to one of the best frameworks for mobile and now web application building (flutter and jaspr)
- it's also C based so working with it means youre working with a trasnferable language between back and front end
- it has remarkable data processing capabilites which make handling complex data structures easier to reason about and work with

### What ifs:
- if favorites.txt were 50gb it stands to reason that users.txt isnt far off, which means we are working with roughly 100gb or data, thats not naturally going to work given that dart has limitied space to load information into memory, it would likely be better to make use of Isolates, or research a solution that would reduce the memory overhead to avoid an out of memory error
- if we were polling for new information all the time...i definitly use isolates but i would also ask the PM and team when we would be comfortable determining old data as stale instead, we would likely already have stored some of the most important information the tricky part would likely be if we have an ever swelling number of users that for some reasons refuse to not vote on the color.

### what would I do if I had more time:
- Im not entirely happy with my loops and naming conventions, would tidy those
- I would have liked to add failure modes
- Definitely would have added a source for files, so we could swap between files if needed


