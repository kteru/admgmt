admgmt - DNS authoritative data management tool
===============================================

Requirements
------------

  * bash
  * ls, cat, cut, grep, date, awk, md5sum, ssh, rsync

Usage
-----

Install

    $ cd /path/to/admgmt
    $ git clone https://github.com/kteru/admgmt.git .

Create Name Server Configuration (only once)

    $ cp sample/conf/servers/ns_bind.conf conf/servers/
    $ vi conf/servers/ns_bind.conf
    (Edit to suit your environments)

Create or Update zone file

    $ cp sample/domains/example.com domains/
    $ vi domains/example.com
    (...snip...)

Upload and Reload each authoritative name server

    $ make

If syncing was failed, run following for resync

    $ make sync
