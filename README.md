# Oct-file_and_Mex_file_examples_FPU_rounding_mode

#oct-file and mex file exampls and changing rounding mode of FPU

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


# change rounding mode by mex: setround.c (*)

x86_64 CPU is supposed.

  switch (rnd)
  
    {
    
      case -1:
      
        mode = FE_DOWNWARD;    # Round toward minus Infinity
        
        break;
        
      case 0:
      
        mode = FE_TONEAREST;  # Round to nearest
        
        break;
        
      case 1:
      
        mode = FE_UPWARD;  # Round toward plus Infinity.
        
        break;
        
      case 2:
      
        mode = FE_TOWARDZERO;  # Round toward zero
        
        break;
        
      default:
      
        mode = FE_TONEAREST;  # Round to nearest
        
        break;
        
    }

compile: mkoctfile --mex setround.c 

example (**):
https://github.com/chibaf/Oct-file_and_Mex_file_examples_FPU_rounding_mode/blob/main/octave_log.txt

octave:43> output_precision = 16

octave:44> setround(-1)  # round downward

octave:45> xd=[1/10;(-1)/10;1/10];

octave:46> yd=[1/10;2/10;(-3)/10];

octave:47> setround(1)   # round upward

octave:48> xu=[1/10;(-1)/10;1/10];

octave:49> yu=[1/10;2/10;(-3)/10];

octave:50> xc=(xd+xu)/2;

octave:51> xr=xu-xc;

octave:52> yc=(yd+yu)/2;

octave:53> yr=yu-yc;

octave:54> zu=xc'*yc+xc'*yr+xr'*yc+xr'*yr

zu = -3.999999999999999e-02

octave:55> setround(-1)  # round downward

octave:56> zd=xc'*yc+xc'*yr+xr'*yc+xr'*yr

zd = -4.000000000000001e-02


# ref:

(**) Linux 数値計算ツール、大石進一、コロナ社、2000年, in japanese https://www.coronasha.co.jp/np/isbn/9784339023787/

Getting Started with Oct-Files (GNU Octave (version 7.2.0)) https://docs.octave.org/latest/Getting-Started-with-Oct_002dFiles.html

GNU Octave: Getting Started with Mex-Files https://docs.octave.org/v7.2.0/Getting-Started-with-Mex_002dFiles.html

(*) Using directed rounding in Octave/Matlab (Kai Torben Ohlhus) https://siko1056.github.io/blog/2021/12/23/octave-matlab-directed-rounding.html

Rounding modes (The GNU C Library) https://www.gnu.org/software/libc/manual/html_node/Rounding.html
