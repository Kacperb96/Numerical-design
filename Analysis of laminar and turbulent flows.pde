TITLE 'Przeplyw 2D'
VARIABLES
     vx, vy, p
DEFINITIONS
     vx0 = 40
     dens = 1
     visc = 1
EQUATIONS
     vx: visc*div(grad(vx)) - dx(p) = dens * (vx * dx(vx) + vy * dy(vx))
     vy: visc*div(grad(vy)) - dy(p) = dens * (vy * dy(vy) + vx * dx(vy))
     p: div(grad(p)) = visc * (dx(vx) + dy(vy))
BOUNDARIES
  REGION 1
    START(0,0)
    natural(p) = 0  value(vx) = 0  value(vy) = 0  line to (10,0)
    value(p) = 0  natural(vx) = 0  natural(vy) = 0  line to (10,2.5)
    natural(p) = 0  value(vx) = 0  value(vy) = 0  line to (6,2.5) bevel (0.5)
    natural(p) = 0  value(vx) = 0  value(vy) = 0  line to (4,1) bevel(0.5)
    natural(p) = 0  value(vx) = 0  value(vy) = 0  line to (0,1)
    natural(p) = 0  value(vx) = vx0  value(vy) = 0  line to close
PLOTS
    vector(vx,vy) as "Predkosc" zoom(10,0.1,0,0)
    contour(p) zoom(3.5,0,3,2.5) as "Cisnienie"
    elevation(vx,vy) from (0,0) to (0,1.0)
    elevation(vx,vy) from (3.5,0) to (3.5,1.0)
    elevation(vx,vy) from (6.5,0) to (6.5,2.5)
    elevation(vx,vy) from (10,0) to (10,2.5)
END
