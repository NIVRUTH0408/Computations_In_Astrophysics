Free Fall Under Gravity 

Problem Statement:
A test object is at rest at a distance of r_0 = 1 AU ( ~ 1.5e11 metres) from the centre of a star of mass M = 2e30 kilograms and radius R = 6.957e8 metres. This object is set to fall freely from this distance towards the star under the effect of the star's gravitational force. The variation of the distance and the free-fall velocity over time is to be determined until the object hits the stellar surface. 

Methodology:
The underlying physical equation is expressed as a second-order ODE, and this is further split into a system of two first-order ODEs. These two first-order ODEs are then solved numerically using the following numerical methods:
    1. Fourth Order Runge-Kutta Method (RK4)
    2. Euler's Method
The accuracy of the latter is compared with that of the former at various time steps.
Key Results and Observations:
1. For an initial step value in time of dt = 1000s, the RK4 and Euler's method provided similar results with slight variations in the behaviour of free-fall velocity.
<img width="1600" height="767" alt="image" src="https://github.com/user-attachments/assets/58edd656-4a72-406c-9330-bbfb6529a198" />
<img width="1608" height="771" alt="image" src="https://github.com/user-attachments/assets/0beb11bd-2248-47ec-be69-ea80033193ca" />
2. The time of free fall was found to be approximately 5.562e6 s, which is roughly 64.4 days until the object reaches the stellar surface.	

3. The accuracy of the Euler's method relative to the RK4 method was tested with dt = 100s, 1000s, 10000s, and 100000s in the Euler's Method. Significant divergence was observed in Euler's method with higher dt values, indicating that this method underestimates gravitational acceleration near impact, resulting in delayed free-fall impact. 
<img width="1568" height="776" alt="image" src="https://github.com/user-attachments/assets/92c7327e-0af4-4f8c-8a1e-d8cbbcd7b87e" />
<img width="1564" height="771" alt="image" src="https://github.com/user-attachments/assets/bb3f3855-48e0-4c75-bf2a-a68acb3589c0" />
<img width="1597" height="784" alt="image" src="https://github.com/user-attachments/assets/3de4a432-e7ab-480c-84c9-395381cfba25" />
<img width="1590" height="775" alt="image" src="https://github.com/user-attachments/assets/dae12f55-29e2-456a-bfb3-b649917d07c8" />
