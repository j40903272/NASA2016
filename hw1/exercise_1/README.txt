
NASA Week 1 exercise: where are the bots?
=========================================

The CSIE workstations lives in the dangerous open Internet.  
Everyday, we experience countless password brute force attack 
from hundreds of bots around the world.  Let’s find out where 
they are from.

You will be given a list of IPs, with their geo-locations.  
You task is to transform it into a specific format suitable 
to be plotted on an online map. 


Online Map
----------

http://www.csie.ntu.edu.tw/~yunchih/map

=====================================================
==> The website also contains an example output!! <==
=====================================================


Material
                   partly completely, with some remaining slots for
                   you to fill out.  The slot is in the form of

                      @==> N <==@

                   where N is the slot number.
--------

* parser.sh:       the script you will be working on.  It has been

                   There are totally six slots.  Please read the
                   hint below.

* raw-ip-list.txt: the input IP list.  Parse this file with 
                   the script.


Format
------

The format of each line is:

[latitude];[longitude];[IP];[organization name]

If “organization name” is empty, please output “Unknown”.

For example, when parsing the following line:

"ip":"91.193.74.33","hostname":"No Hostname","city":"Gibraltar","region":"","country":"GI","loc":"36.1333,-5.3500",org:""

you should print "Unknown" in the [orgnization name] field.


Correctness
-----------

The MD5 sum of your output file should be: 3ab442e3a6c0f8b9700706871545f83c
Test it with:

$ ./parser.sh > output.txt
$ md5sum output.txt
3ab442e3a6c0f8b9700706871545f83c  output.txt


Hint for each slot
------------------

* Slot 1: Dump the input file so that the for loop can read it
          line by line.

* Slot 2: What is the field number of IP, when delimitated by '"'?
          Count with your finger from left to right. XD

* Slot 3: The regular expression pattern of an IP.  How do you
          express the format "[Numbers].[Numbers].[Numbers].[Numbers]"
          in regular expression?  See the pattern of next grep for example.

* Slot 4: Extract "echo" and "cut", as we have done in "$ip" and "$location"
          You don't need to validate with `grep` here.

* Slot 5: If "$org" is empty, assign it as "Unknown" instead.

* Slot 6: Print "$location" "ip" "$org".  You can use "echo" or "printf".
