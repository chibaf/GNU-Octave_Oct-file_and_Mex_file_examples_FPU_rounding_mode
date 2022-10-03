# Oct-file_examples
oct-file and mex file exampls

# short example and octave set up: helloworld.cc:
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


# change rounding mode: setround.c

  switch (rnd)
  
    {
    
      case -1:
      
        mode = FE_DOWNWARD;
        
        break;
        
      case 0:
      
        mode = FE_TONEAREST;
        
        break;
        
      case 1:
      
        mode = FE_UPWARD;
        
        break;
        
      case 2:
      
        mode = FE_TOWARDZERO;
        
        break;
        
      default:
      
        mode = FE_TONEAREST;
        
        break;
        
    }

compile: mkoctfile --mex setround.c 

example:

output_precision = 20

octave:44> setround(-1)

octave:45> xd=[1/10;(-1)/10;1/10];

octave:46> yd=[1/10;2/10;(-3)/10];

octave:47> setround(1)

octave:48> xu=[1/10;(-1)/10;1/10];

octave:49> yu=[1/10;2/10;(-3)/10];

octave:50> xc=(xd+xu)/2;

octave:51> xr=xu-xc;

octave:52> yc=(yd+yu)/2;

octave:53> yr=yu-yc;

octave:54> zu=xc'*yc+xc'*yr+xr'*yc+xr'*yr

zu = -3.999999999999999e-02

octave:55> setround(-1)

octave:56> zd=xc'*yc+xc'*yr+xr'*yc+xr'*yr

zd = -4.000000000000001e-02


# ref:

Getting Started with Oct-Files (GNU Octave (version 7.2.0)) https://docs.octave.org/latest/Getting-Started-with-Oct_002dFiles.html
