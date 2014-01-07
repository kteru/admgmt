admgmt - DNS authoritative data management tool
===============================================

Requirements
------------

  * bash
  * ls, cat, cut, grep, date, awk, md5sum, ssh, rsync


Structure
---------

    +---------------+         +---------------+
    | [admgmt]      |         | [NS]          | +
    |               |         |               | |
    | ./domains/*   |         |               | |
    |    | (1)      |         |               | |
    |    v          |   (2)   |               | |
    | ./tmp/zones/* | ------> |               | |
    |               | ------> |               | |
    +---------------+   (3)   +---------------+ | ...
                                +---------------+

1. update  
Detecting new/deleted/changed zone file, and updating serial numbers.

2. sync  
Syncing zone directory by using rsync.

3. reload  
Throwing commands to reconfigure/reload name server via ssh.


Usage
-----

### Install

    $ cd /path/to/admgmt
    $ git clone https://github.com/kteru/admgmt.git .

### Create Name Server Configuration (only once)

    $ cp sample/conf/servers/ns_bind.conf conf/servers/
    $ vi conf/servers/ns_bind.conf
    (Edit to suit your environments)

### Create or Update zone file

    $ cp sample/domains/example.com domains/
    $ vi domains/example.com
    (...snip...)

You Should change SOA serial number to `__SERIAL__`.

### Upload and Reload each authoritative name server

    $ make
    [new zone    ] example.com
    [starting sync] 192.0.2.11      (Name Server 1)
    [success] 192.0.2.11      (Name Server 1)

### If syncing was failed, run following for resync

    $ make sync
    [starting sync] 192.0.2.11      (Name Server 1)
    [success] 192.0.2.11      (Name Server 1)

