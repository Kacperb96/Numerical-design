TITLE 'DYFUZJA'
COORDINATES cartesian2
VARIABLES        { system variables }
C
DEFINITIONS
D=0.5
C0=1.0
 INITIAL VALUES
C=0
EQUATIONS
 C: D*(dxx(C)+dyy(C))=dt(C)
! CONSTRAINTS    { Integral constraints }
BOUNDARIES
  REGION 1
    START(0,0) natural(C)=0
    line to (1,0) value(C) = 0
    line to (1,1) value(C) = C0
    line to (0,1) natural(C)=0
    line to close
TIME 0 TO 1
PLOTS
FOR t=0.0
contour(C)
surface(C)
FOR t=1.0
contour(C)
surface(C)
END










