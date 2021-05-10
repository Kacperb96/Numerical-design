title 'Odksztalcenie-naprezenie'
VARIABLES
ux,uy
DEFINITIONS
v=0.3
E
F0=10E9
G = E/((1+v)*(1-2*v))
C11 = G*(1-v)
C12 = G*v
C21= G*v
C22 = G*(1-v)
C33 = G*(1-2*v)/2
sigx=C11*dx(ux)+C12*dy(uy)
sigy=C21*dx(ux)+C22*dy(uy)
txy=(C33*(dy(ux)+dx(uy)))
VonM = sqrt(sigx^2+sigy^2-sigx*sigy+3*txy)
INITIAL VALUES
ux=0
uy=0
EQUATIONS
!ux: dx(sigx) + dy(txy) = 0
!uy: dx(txy) + dy(sigy) = 0
ux: dx(C11*dx(ux)+C12*dy(uy)) + dy(C33*(dy(ux)+dx(uy))) = 0
uy: dx(C33*(dy(ux)+dx(uy))) + dy(C21*dx(ux)+C22*dy(uy)) = 0
BOUNDARIES
region 1 {Prostokat}
    E = 100E9
    start(0,0) load(ux)=0 load(uy)=0
    line to (3,0) load(ux)=F0 load(uy)=0
    line to (3,1) load(ux)=0 load(uy)=0
    line to (0,1) value(ux)=0 value(uy)=0
    line to close
region 2 {Kolo}
    E = 10E9
    start(1.5,0.25)
    arc(center=1.5,0.5) angle=-360
PLOTS
grid(x+ux,y+uy)
vector(ux,uy) as "Wektory"
contour(ux) as "X-przemieszczenie"
contour(uy) as "Y-przemieszczenie"
contour(sigx/E) as "X-odksztalcenie"
contour(sigy/E) as "Y-odksztalcenie"
contour(txy/E) as "odksztalcenie calkowite"
contour(sigx) as "X-naprezenie"
contour(sigy) as "Y-naprezenie"
contour(VonM) contours = 50 as "Hubera/von Misesa"

END













