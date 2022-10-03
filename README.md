# Oct-file_examples
oct-file examples

(1) helloworld.cc:
how to use

mkoctfile helloworld.cc

helloworld.oct is built

set path to a location of helloworld.oct in .octaverc at your home

.octaverc code example

addpath("~/octave");

where ~/octave is helloworld.oct's location

on octave:

octave:1> helloworld 

Hello World has 0 input arguments and 0 output arguments.

octave:2> helloworld (1,2,3)

Hello World has 3 input arguments and 0 output arguments.


# ref:

Getting Started with Oct-Files (GNU Octave (version 7.2.0)) https://docs.octave.org/latest/Getting-Started-with-Oct_002dFiles.html
