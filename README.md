# Nikon vs. Canon

## The project to end the battle.

### WTF, mate?

When looking to upgrade my current [Canon Rebel XSi][canon-rebel-xsi] to something newer, 

### Installation

	cd /Library/WebServer/Documents # on a mac, this is your htdocs folder
	git clone git://github.com/parkr/Nikon-vs.-Canon.git "nikon-vs-canon"
	cd nikon-vs-canon
	mysql db_name < SETUP.sql # you may need to specify a username and/or password
	cp db.default.php db.php # create the db file. modify.
	open http://localhost/nikon-vs-canon/
	
You'll probably want to make sure you have a MySQL backend installed & that your localhost handles all of this stuff.

### Usage

_GO CRAZY!!_ My normal workflow is:

	ruby get.rb
	ruby convert.rb > new.sql # dump output into sql file
	mysql db_name < new.sql # you may need to specify a username and/or password
	rm new.sql
	ruby clean_csvs.rb
	open http://localhost/nikon-vs-canon/

### License

Gah, do whatever you like with it! Distributed under the MIT License:

> Copyright (C) 2011 by Parker J. Moore
>
> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the "Software"), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:
> 
> The above copyright notice and this permission notice shall be included in
> all copies or substantial portions of the Software.
> 
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> THE SOFTWARE.

Bonsoir!

[canon-rebel-xsi]: http://www.amazon.com/Canon-Digital-Camera-18-55mm-3-5-5-6/dp/B0012YA85A