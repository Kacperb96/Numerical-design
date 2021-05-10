TITLE 'Naprezenia termomechaniczne'
VARIABLES
  ux,uy
DEFINITIONS
 v = 0.3 {Wspó?czynnik Poissona}
 E {Modu? Younga}
 cte {Wspó?czynnik rozszerzalno?ci cieplnej}
 G = E/((1+v)*(1-2*v))
 C11 = G*(1-v)
 C12 = G*v
 C21= G*v
 C22 = G*(1-v)
 C33 = G*(1-2*v)/2
 b = G*cte*(1+v)
 Temp=300 {Temperatura otoczenia}
 Tref=273 {Temperatura odniesienia}
 DelT=Temp-Tref
 scale=1e3
 sigx=C11*dx(ux)+C12*dy(uy)-b*DelT
 sigy=C21*dx(ux)+C22*dy(uy)-b*DelT
 txy=(C33*(dy(ux)+dx(uy)))
 VonM = sqrt(sigx^2+sigy^2-sigx*sigy+3*txy)
INITIAL VALUES
  ux=0 uy=0
EQUATIONS
  ux: dx(C11*dx(ux)+C12*dy(uy)-b*DelT) + dy(C33*(dy(ux)+dx(uy))) = 0
  uy: dx(C33*(dy(ux)+dx(uy))) + dy(C21*dx(ux)+C22*dy(uy)-b*DelT) = 0
BOUNDARIES
REGION 1
    E=10e9
    cte=1e-6
    start(0,0)
    line to(3,0)
    line to(3,1)
    line to(0,1)
    line to close
REGION 2
    E=100e9
    cte=10e-6
    start(1.5,0.25)
    arc(center=1.5,0.5) angle=-360
PLOTS
    grid(x,y)
    grid(x+scale*ux, y+scale*uy)
    contour(ux) as "X-przemieszczenie"
    contour(uy) as "Y-przemieszczenie"
    contour(sigx/E) as "X-odksztalcenie"
    contour(sigy/E) as "Y-odksztalcenie"
    contour(txy/E) as "odksztalcenie calkowite"
    contour(sigx) as "X-naprezenie"
    contour(sigy) as "Y-naprezenie"
    contour(VonM) as "Teoria Hubera / von Misesa"
END


