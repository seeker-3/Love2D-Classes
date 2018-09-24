# Love2D-Classes
Boilerplate classes for Love2D

Basic classes for Love2D game development.

Object class system implicitly creates a tree of instances that can be iterated through for drawing, updating.

Placing updateAll(dt) and drawAll() in their respective love callbacks will handle updating the entire tree.

Also any child class can be selected to iterate through all of its instances and childrens' instances
with its iter method to handle collision detection and other object interactions.
