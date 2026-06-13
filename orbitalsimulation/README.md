# Orbit of the Earth

# Problem Statement: 

To plot the orbit of the Earth around the Sun using the equations of motion governed by the gravity of the Sun.

# Methodology:

Initially, the governing second-order ODE is formulated via Newton's Law of Gravitation in both the Cartesian coordinates, namely x and y. 

$$\frac{d^2x}{dt^2} = -\frac{GMx}{r^3}$$  $$\frac{d^2y}{dt^2} = -\frac{GMy}{r^3}$$

These two ODEs are further split into first-order ODEs governing the behaviour of positions and velocities in those directions. 

These ODEs are solved numerically using the RK4 method using proper initial conditions, resulting in the x and y positions being plotted using the built-in MATLAB plotter.

The position of the sun is marked at the origin, and the earth is marked at the initial point ( 1.496e11, 0 ).

# Results:

The numerical solutions of the ODEs are plotted in the Cartesian plane, and the orbit is visualised.

Orbital period simulated: 3.1536 × 10⁷ s (1 Earth year)

Orbital radius maintained: 1.496 × 10¹¹ m (1 AU)

Initial orbital velocity: 29,780 m/s

Energy conservation verified - no orbital drift observed

<img width="1236" height="780" alt="image" src="https://github.com/user-attachments/assets/1450d497-91e9-46aa-b69b-e6a58baa81b4" />
