To load a single file into IRB, use `irb -r ./cargohold.rb`

Chapter 4 covers:
- Modules, up close and in detail
- Similarities and differences between modules and classes (both can bundle methods and constants together, but modules can’t be instantiated)
- Examples of how you might use modules to express the design of a program
- An object’s-eye view of the process of finding and executing a method in response to a message, or handling failure with method_missing in cases where the message doesn’t match a method
- How to nest classes and modules inside each other, with the benefit of keeping namespaces separate and clear
