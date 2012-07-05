Tic-tac-toe in Lua
==================

This is an implementation of the tic-tac-toe game in [Lua](http://www.lua.org/).

Install for OS X
----------------

`brew install lua` (installs Lua 5.1)
`brew install luarocks --use-gcc` (build fails with LLVM)
`luarocks install telescope`

Testing
-------

Tests use [Telescope](https://github.com/norman/telescope) which can be installed with [luarocks](http://luarocks.org/) (available via Homebrew).

Run `make` to run the tests.

Note: If you would like to use Lua 5.2 be sure to use the version of Telescope in the git repo linked below as Lua 5.2 removes `getfenv` and `setfenv`. The version of Telescope in the master branch on github has a work around (the version of Telescope installed by luarocks does not).

Assumptions
===========

* 3x3 board
* cells are numbered 1-9 starting at upper left and ending at lower right

Notes on Lua
============

The [Lua Style Guide](http://lua-users.org/wiki/LuaStyleGuide) is a good overview of the language.

Scope
-----

Variables are global unless the keyword `local` is used or they are within a block expression (such as the `i` variable in `for i = 1, 10 do ... end`).

Data structures
---------------

The manual has this to say about tables:

> The type table implements associative arrays, that is, arrays that can be indexed not only with numbers, but with any value (except nil). Tables can be heterogeneous; that is, they can contain values of all types (except nil). **Tables are the sole data structuring mechanism in Lua**; they can be used to represent ordinary arrays, symbol tables, sets, records, graphs, trees, etc. To represent records, Lua uses the field name as an index. The language supports this representation by providing a.name as syntactic sugar for a["name"]. There are several convenient ways to create tables in Lua.

Note that nil values in tables do not behave the same as in Ruby:

  `{ nil }` is the same as `{}`

  `{ nil, 1, nil }` is the same as `{ nil, 1 }`

Classes
-------

Lua does not have classes yet they can be added. I took the approach [described on the Lua wiki under Simple Lua Classes](http://lua-users.org/wiki/SimpleLuaClasses) using the simplest option that fulfilled the requirements. Calling class methods requires the use of `:` as in `classInstance:method_name()` which results in `self` working within the scope of `method_name()`. In short, a class is built upon a table.

Modules
-------

As with classes, modules are not baked into Lua. The Lua Style Guide has a section on modules which is the approach used in this project.

Operators
---------

* `..` string concatenation
* `~=` not equal
* `==` compares by type first (so `"1" == 1` is false) and then reference (so `{ 1 }` == `{ 1 }` is false)
* `...` when used as an argument parameter in method/function definition indicates an arbigration number of arguments can be passed and will be present within the method/function scope as the variable `arg`.

Method names
------------

It is not allowed to have `?` in a method name such as `play_again?`.

