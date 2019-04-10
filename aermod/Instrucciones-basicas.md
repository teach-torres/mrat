
# Try Me First Sample Run

A number of users who are being exposed to AERMOD for the first time, are running into problems 
just setting up the test cases and running them. Try Me First is designed for the novice to setup 
and **successfully** run an AERMOD sample run.

The use of AERMOD requires a user to read the manuals and in particular, to **understand** what 
they are trying to convey. Try Me First is simply a “plug and crunch” example to familiarize the 
user with how to set up and run AERMOD in a generic sense. Any understanding needs to come from 
reading the guides.

AERMOD was coded so that the input file has to be named `AERMOD.INP`. The batch files in the 
actual test cases, copy a test case input file to `AERMOD.INP` before executing AERMOD. Here is 
a copy of a segment of one of those batch files:

```terminal
copy aertest.inp aermod.inp aermod
copy aermod.out aertest.out
```

Note that the output file is `AERMOD.OUT` and needs to be copied from `AERMOD.OUT` to another 
file. If this is not done, `AERMOD.OUT` will be over written next time **AERMOD** is run and 
you will lose whatever data was in the previous `AERMOD.OUT` file.
***********************************************************************************************
Many a first time user will go into Windows Explorer, double click on **AERMOD.EXE** and then 
call us wondering why a window blinked open and shut with no indication of anything happening. 
You **did** run **AERMOD** but you have no idea of whether it was a successful run or not. You 
need to run **AERMOD** from the Windows Command Prompt to see any error or success messages. 
**AERMOD** was designed to run from a Command Prompt window (e.g. Start | All Programs | 
Accessories | Command Prompt).

The Command Prompt window looks like this initially:

<!--
***********************************************************************************************
-->
