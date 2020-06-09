# enigma-machine
Turing Mod 1 final project

Built to emulate the Enigma encryption scheme, using a random key and the date to create the shift. Utilizing 27 characters (alphabet + space), input is transformed using a series of four keys built from the shift.
Use command line interface to run the program

Encrypt: $ ruby ./lib/encrypt.rb message.txt encrypted.txt

Decrypt: $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 'key' 'date'


### Self Evaluation
**Based on the rubric:**
* The project meets expectation in functionality. It can encrypt and decrypt with command line interface, encryption can be given a key and/or date or create them, and decryption can be done with a key or date, or just the key and it assumes the current date. Project cannot crack a decryption without a key.
* The project exceeds expectation in OOP. It utilizes and inheritance scheme to pass separate functionality and pass it on to the enigma class. Classes are distinct and have logical purposes. And no class or method is overly large, making use of helper methods when makes sense.
* The project meets expectation in Ruby conventions and mechanics. Hashes are used in a logical way, code is properly indented and well named. Only encryption method is longer than 10 lines. Most enumerable and data structures are best for the job. Some could be refactored for efficiency.
* The project meets or exceeds expectation in TDD. Every method is tested at unit and integration level. Test coverage is 100%. Tests were all written before methods. Mocks and stubs are used to test for randomness (both in pure randomness and date changes)
* The project meets or exceeds expectation in version control. Over 40 commits, pull requests include related and logical chunks of functionality, pull requests are named and document purpose.
