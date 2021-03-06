Integrity
=========

[Integrity][] is your friendly automated Continuous Integration server.

Prowl
=====

[Prowl][] is a "Growl client for the iPhone". It is an iPhone app that
forwards Growl notifications to your iPhone. It also has an API that
lets you push any sort of notification you want.

Integrity Prowl Notifier
========================

This lets Integrity alert you after a build. You can specify if you want
to be notified after successful, failed, and/or pending builds.

Setup Instructions
==================

Just install this gem via
`sudo gem install integrity-prowl --source http://gemcutter.org` and then
in your Rackup (ie, `config.ru`) file:

    require "rubygems"
    require "integrity/notifier/prowl"

License
=======

(The MIT License)

Copyright (c) 2009 [Benny Wong][]

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[Integrity]: http://integrityapp.com
[Prowl]: http://prowl.weks.net
[Benny Wong]: http://bwong.net
