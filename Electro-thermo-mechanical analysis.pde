TITLE 'elektro-termo-mechanika'
COORDINATES cartesian2
VARIABLES
  Temp Volt     ux,uy
DEFINITIONS
 lambda ro
 k=10
 Vg=100 Va=0
 Ta=273
 j=-ro*grad(Volt)
 q=-lambda*grad(Temp)
 heat=dot(j,j)/ro
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
 Tref=273 {Temperatura odniesienia}
 DelT=Temp-Tref
 scale=1e3
 sigx=C11*dx(ux)+C12*dy(uy)
 sigy=C21*dx(ux)+C22*dy(uy)
 txy=(C33*(dy(ux)+dx(uy)))
INITIAL VALUES
ux=0
uy=0
EQUATIONS
  Volt: Div(j)=0
  Temp: Div(q)=heat
  ux: dx(C11*dx(ux)+C12*dy(uy)-b*DelT) + dy(C33*(dy(ux)+dx(uy))) = 0
  uy: dx(C33*(dy(ux)+dx(uy))) + dy(C21*dx(ux)+C22*dy(uy)-b*DelT) = 0
BOUNDARIES
  region 1
     lambda=1 ro=1 E = 100E9  cte=1e-6
     start(0,0)  load(ux)=Volt load(uy)=0
     natural(Temp)=k*(Temp-Ta)natural(Volt)=0
     line to (3,0)  load(ux)=Ta load(uy)=0
     natural(Temp)=0 value(Volt)=Va
     line to (3,1) load(ux)=0 load(uy)=0
     natural(Temp)=k*(Temp-Ta)natural(Volt)=0
     line to (0,1)  value(ux)=Ta value(uy)=0
     natural (Temp)=0 value(Volt)=Vg
     line to close
  region 2
     lambda=10 ro=10 E = 100E9  cte=1e-6
     start(1.5,0.25)
     arc(center=1.5,0.5) angle=360
PLOTS
     contour(Volt) vector(j)
     contour(Temp) vector (q)
     grid(x+ux,y+uy) vector(ux,uy) as "Wektory"
     contour(txy/E) as "odksztalcenie calkowite"
     contour(sigx) as "X-naprezenie"
     contour(sigy) as "Y-naprezenie"
END
