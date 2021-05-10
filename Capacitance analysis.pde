TITLE 'Pojemnosc'
VARIABLES
 V
DEFINITIONS
 eps
 d=1
 V1=100
 V2=0
 w=dot(-eps*grad(V),-grad(V))/2
EQUATIONS
 V:Div(-eps*grad(V))=0
BOUNDARIES
 region 1
     eps=5
start(0,1.3) natural(V)=0
     line to(0.4,1.3)value(V)=V2
     line to(0.4,1.2) natural(V)=0
     line to(0.4,1.2)value(V)=V2
     line to(0.1,1.2)natural(V)=0
     line to(0.1,1.2)value(V)=V2
     line to(0.1,1.1)natural(V)=0
     line to(0.1,1.1)value(V)=V2
     line to(0.4,1.1)natural(V)=0
     line to(0.4,1.1)value(V)=V2
     line to(0.4,1)natural(V)=0
     line to(0.4,1)value(V)=V2
     line to(0.4,0.8)natural(V)=0
     line to(0.4,0.8)value(V)=V2
     line to(0.1,0.8)natural(V)=0
     line to(0.1,0.8)value(V)=V2
     line to(0.1,0.7)natural(V)=0
     line to(0.1,0.7)value(V)=V2
     line to(0.4,0.7)natural(V)=0
     line to(0.4,0.7)value(V)=V2
     line to(0.4,0.4)natural(V)=0
     line to(0.4,0.4)value(V)=V2
     line to(0.1,0.4)natural(V)=0
     line to(0.1,0.4)value(V)=V2
     line to(0.1,0.3)natural(V)=0
     line to(0.1,0.3)value(V)=V2
     line to(0.4,0.3)natural(V)=0
     line to(0.4,0.3)value(V)=V2
     line to(0.4,0)natural(V)=0
     line to(0.4,0)value(V)=V2

     line to(0,0)natural(V)=0
     line to(0,0)value(V)=V1
     line to(0,0.1)natural(V)=0
     line to(0,0.1)value(V)=V1
     line to(0.3,0.1)natural(V)=0
     line to(0.3,0.1)value(V)=V1
     line to(0.3,0.2)natural(V)=0
     line to(0.3,0.2)value(V)=V1
     line to(0,0.2)natural(V)=0
     line to(0,0.2)value(V)=V1
     line to(0,0.5)natural(V)=0
     line to(0,0.5)value(V)=V1
     line to(0.3,0.5)natural(V)=0
     line to(0.3,0.5)value(V)=V1
     line to(0.3,0.6)natural(V)=0
     line to(0.3,0.6)value(V)=V1
     line to(0,0.6)natural(V)=0
     line to(0,0.6)value(V)=V1
     line to(0,0.9)natural(V)=0
     line to(0,0.9)value(V)=V1
     line to(0.3,0.9)natural(V)=0
     line to(0.3,0.9)value(V)=V1
     line to(0.3,1)natural(V)=0
     line to(0.3,1)value(V)=V1
     line to(0,1)natural(V)=0
     line to(0,1)value(V)=V1
line to close
PLOTS
     contour(V)
     contour(w)
SUMMARY
     report integral(w) as 'Energia'
     report 2*integral(w)/((V1-V2)^2) as 'Pojemnosc'
END



