In this project, the motion of the double pendulum is investigated using RK4 method and built-in MATLAB function ode45.

### The Problem
There are two bobs with masses m1 and m2. The mass m1 is connected to the wall with a rigid massless string of length L1 and mass m2 is connected to mass m1 with a rigid massles string of Lenght L2.
The system is shown in the figure below.

The system is shown in the figure below.

<img src="https://github.com/user-attachments/assets/a6096eed-43b9-4102-82d3-ad875fcff87c" alt="Time Period" width="400">

The forces acting on mass m1 is as seen in the figure below.

<img src="https://github.com/user-attachments/assets/cdcf8a70-0630-4c61-b3e7-6a265c682c15" alt="Time Period" width="400">

The corresponding equations of motion for the mass m1 are as follows:

<img src="https://github.com/user-attachments/assets/06df0483-fd15-4249-aa86-bc8866ce21d1" alt="Time Period" width="400">

The forces acting on mass m2 is as seen in the figure below.

<img src="https://github.com/user-attachments/assets/5b95c3ee-4802-46c8-9e31-7feaecd01419" alt="Time Period" width="400">

The corresponding equations of motion for mass m2 are as follows. 

<img src="https://github.com/user-attachments/assets/a7e3e1f4-8f4a-4563-bce3-f60f41d5d00d" alt="Time Period" width="400">

When necessary transformations and simplifications are performed using the existing relations, the equations for theta1 and theta2 can be written in their matrix forms as follows:

<img src="https://github.com/user-attachments/assets/fa6667ce-2e53-4893-9fa1-608f0d4aace5" alt="Time Period" width="400">

Then, the equations for theta1 and theta2 are multiplied with the inverse of the A matrix and written in their explicit forms as follows:

<img src="https://github.com/user-attachments/assets/343fc51a-ea42-4cfb-84fc-8b3aae5ef430" alt="Time Period" width="400">

To solve this set of differential equations using numerical methods, they are written as a system of first order differential equations as follows:

<img src="https://github.com/user-attachments/assets/00f385ae-d037-43e9-9d9b-2b32862170de" alt="Time Period" width="400">

Thus, the equations become as follows:

<img src="https://github.com/user-attachments/assets/bceebe90-679f-4307-9ca5-89266bc548c3" alt="Time Period" width="400">

Where the coefficient matrix are defined as follows:

<img src="https://github.com/user-attachments/assets/34667538-a89e-41b8-afc2-be86c39f2a78" alt="Time Period" width="400">



### The Problem
Since the lengths of the strings are constant, these equations are added  in the x-direction and in the y-direction and reduced to 2 equations, resulting in the following simplified forms:

<img src="" alt="Time Period" width="400">

These equations are then transformed into angular form by multiplying the x-direction equation by costheta1 and the y-direction equation by sintheta1. When these equations are added and simplified, they can be written in the following forms:

<img src="" alt="Time Period" width="400">

The Cartesian coordinates of the masses can be related to the angles theta1 and theta2 using the following relations:

<img src="" alt="Time Period" width="400">

After replacing the Cartesian coordinates (x1,y1,x2,y2) with appropriate forms in terms of theta1 and theta2, the equations of motion in theta1 and theta2 can be obtained:

<img src="" alt="Time Period" width="400">

A reduced mass of the second bob can be defined for simplicity as follows:

<img src="" alt="Time Period" width="400">

Finally the resulting coupled differential equations are written for the angles theta1 and theta2.

<img src="" alt="Time Period" width="400">

To solve for theta1 and theta2 using numerical methods, they are written explicitly in the matrix form as follows:

<img src="" alt="Time Period" width="400">

This system of linear equation can be solved for theta1 and theta2 by multiplying both sides with the inverse of the A matrix as follows with the simplified terms.

<img src="" alt="Time Period" width="400">




























































<img src="" alt="Time Period" width="400">
<img src="" alt="Time Period" width="400">
<img src="" alt="Time Period" width="400">
<img src="" alt="Time Period" width="400">
<img src="" alt="Time Period" width="400">
<img src="" alt="Time Period" width="400">
<img src="" alt="Time Period" width="400">
<img src="" alt="Time Period" width="400">
<img src="" alt="Time Period" width="400">
<img src="" alt="Time Period" width="400">
<img src="" alt="Time Period" width="400">
<img src="" alt="Time Period" width="400">
<img src="" alt="Time Period" width="400">
<img src="" alt="Time Period" width="400">
<img src="" alt="Time Period" width="400">
<img src="" alt="Time Period" width="400">
