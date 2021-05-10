TITLE 'Lab3'
COORDINATES cartesian3
VARIABLES
V
! SELECT
 DEFINITIONS
r=10e-3/2
l=0.1
DV=10
ro=1
E=-grad(V)
j=ro*E
! INITIAL VALUES
EQUATIONS
V:Div(-ro*grad(V))=0
EXTRUSION
surface 'bottom' z=0
surface'top' z=l
! CONSTRAINTS
BOUNDARIES
region "domain"
surface "bottom" value(V)=0
surface "top" value(V)=DV
start(r,0)
natural(V)=0arc(center=0,0) angle=360
natural(V)=0arc(center=0,0) angle=360
PLOTS
contour(normal(j)) ON 'top' !z=0
SUMMARY
report(DV/surf_integral(normal(j),'bottom')) as 'R-numeryczne R [Ohm]'
report(1/ro*l/(pi*r*r))as 'R-analityczne'
END


!line to (2*r,0) natural(V)=0
!line to (2*r,2*r) natural(V)=0
!line to (0,2*r) natural (V)=0
!line to close









