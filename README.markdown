Tic-tac-toe in Lua
==================

This is an implementation of the tic-tac-toe game in [Lua](http://www.lua.org/).

Testing
-------

Tests use [Telescope](https://github.com/norman/telescope) which can be installed with [luarocks](http://luarocks.org/) (available via Homebrew).

Run `make` to run the tests.

Notes on Lua
============

Scope
-----

Variables are global unless the keyword `local` is used or they are within a block expression (such as the `i` variable in `for i = 1, 10 do ... end`).

Data structures
---------------

The manual has this to say about tables:

> The type table implements associative arrays, that is, arrays that can be indexed not only with numbers, but with any value (except nil). Tables can be heterogeneous; that is, they can contain values of all types (except nil). **Tables are the sole data structuring mechanism in Lua**; they can be used to represent ordinary arrays, symbol tables, sets, records, graphs, trees, etc. To represent records, Lua uses the field name as an index. The language supports this representation by providing a.name as syntactic sugar for a["name"]. There are several convenient ways to create tables in Lua.

Classes
-------

Lua does not have classes yet they can be added. I took the approach [described on the Lua wiki under Simple Lua Classes](http://lua-users.org/wiki/SimpleLuaClasses) using the simplest option that fulfilled the requirements. Calling class methods requires the use of `:` as in `classInstance:method_name()` which results in `self` working within the scope of `method_name()`. In short, a class is built upon a table.

Operators
---------

* `..` string concatenation
* `~=` not equal
* `...` when used as an argument parameter in method/function definition indicates an arbigration number of arguments can be passed and will be present within the method/function scope as the variable `arg`.

Method names
------------

It is not allowed to have `?` in a method name such as `play_again?`.
