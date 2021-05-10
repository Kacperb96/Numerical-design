TITLE 'Laboratorium 4'
VARIABLES
Temp
qp
qk
DEFINITIONS
k=10
e=1
o=5.67E-8  !stala Boltzmanna
lambda=0
Tg=3500
Tc=300
EQUATIONS
Temp: Div(-lambda*grad(Temp))=0
qp:e*o*(Tg^4-Tc^4)=qp
qk:k*(Tg-Tc)=qk
BOUNDARIES
region 1  {prostokat}
     lambda=1
     start(0,0)
     natural(Temp)=0
     line to (3,0)
     value(Temp)=qp
     line to(3,1)
     natural(Temp)=0
     line to(0,1)
    value(Temp)=qk
     line to close
region 2   {kolo}
     lambda=10
     start(1.5,0.25)
     arc(center=1.5,0.5) angle=-360
PLOTS
     contour(Temp)
     vector(-lambda*grad(Temp))
END
