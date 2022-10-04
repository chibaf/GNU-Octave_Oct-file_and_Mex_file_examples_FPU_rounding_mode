// This code from:
// "Using directed rounding in Octave/Matlab (Kai Torben Ohlhus)"
// https://siko1056.github.io/blog/2021/12/23/octave-matlab-directed-rounding.html

#include <mex.h>
#include <fenv.h>
#include <float.h>

#pragma STDC FENV_ACCESS ON

void mexFunction ( int nlhs, mxArray *plhs[],
                   int nrhs, const mxArray *prhs[] ) {

  int rnd = (int) mxGetScalar (prhs[0]);
  int mode = FE_TONEAREST;

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

  fesetround (mode);
}