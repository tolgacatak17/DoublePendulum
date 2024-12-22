# Modeling the Behavior of a Double Pendulum

This repository contains a project for the **Computer Applications (ME303)** course at **Bogazici University**, Mechanical Engineering Department. This project investigates the motion of a double pendulum using the **Runge-Kutta 4th Order (RK4)** method and MATLAB's built-in **ode45** function.

---

## Problem Description

The double pendulum consists of two bobs of masses m<sub>1</sub> and m<sub>2</sub>. The first bob (m<sub>1</sub>) is attached to a fixed pivot by a rigid, massless string of length L<sub>1</sub>, while the second bob (m<sub>2</sub>) is connected to the first by another rigid, massless string of length L<sub>2</sub>. The system's dynamics are governed by nonlinear equations of motion, leading to chaotic behavior under certain conditions.

---

## Mathematical Model

### System Description

The system is depicted below:

<p align="center">
  <img src="https://github.com/user-attachments/assets/a6096eed-43b9-4102-82d3-ad875fcff87c" alt="Double Pendulum Setup" width="300">
</p>

### Forces Acting on m<sub>1</sub>

The forces acting on m<sub>1</sub> are shown in the figure below:

<p align="center">
  <img src="https://github.com/user-attachments/assets/cdcf8a70-0630-4c61-b3e7-6a265c682c15" alt="Forces on m1" width="300">
</p>

The corresponding equations of motion for m<sub>1</sub> are:

<p align="center">
  <img src="https://github.com/user-attachments/assets/06df0483-fd15-4249-aa86-bc8866ce21d1" alt="Equations of Motion for m1" width="350">
</p>

### Forces Acting on m<sub>2</sub>

The forces acting on m<sub>2</sub> are shown in the figure below:

<p align="center">
  <img src="https://github.com/user-attachments/assets/5b95c3ee-4802-46c8-9e31-7feaecd01419" alt="Forces on m2" width="300">
</p>

The corresponding equations of motion for m<sub>2</sub> are:

<p align="center">
  <img src="https://github.com/user-attachments/assets/a7e3e1f4-8f4a-4563-bce3-f60f41d5d00d" alt="Equations of Motion for m2" width="350">
</p>

---

## Matrix Form and Simplifications

After performing the necessary transformations and simplifications, the equations for θ<sub>1</sub> and θ<sub>2</sub> can be written in matrix form as follows:

<p align="center">
  <img src="https://github.com/user-attachments/assets/fa6667ce-2e53-4893-9fa1-608f0d4aace5" alt="Matrix Form" width="400">
</p>

The detailed derivation of these equations is provided in the last section to demonstrate how the transformations and simplifications are applied step-by-step.

By multiplying with the inverse of the A matrix, the explicit equations for θ<sub>1</sub> and θ<sub>2</sub> are obtained:

<p align="center">
  <img src="https://github.com/user-attachments/assets/343fc51a-ea42-4cfb-84fc-8b3aae5ef430" alt="Explicit Equations" width="500">
</p>

---

## First-Order Differential Equations

To solve this set of equations using numerical methods, they are converted into a system of first-order differential equations:

<p align="center">
  <img src="https://github.com/user-attachments/assets/00f385ae-d037-43e9-9d9b-2b32862170de" alt="First Order System" width="425">
</p>

The system becomes:

<p align="center">
  <img src="https://github.com/user-attachments/assets/bceebe90-679f-4307-9ca5-89266bc548c3" alt="Expanded System" width="250">
</p>

Where the coefficient matrices are defined as:

<p align="center">
  <img src="https://github.com/user-attachments/assets/34667538-a89e-41b8-afc2-be86c39f2a78" alt="Coefficient Matrices" width="500">
</p>

---

## Initial Conditions

The physical values and initial conditions for the example solution are:

<p align="center">
  <img src="https://github.com/user-attachments/assets/eebe5fd5-afa0-4855-b79b-0ef32b998232" alt="Physical Values" width="375">
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/a6adb2de-6684-42e9-93b5-6acbcd90f011" alt="Initial Conditions" width="375">
</p>

---

## Example Solution

Using the default values, the system is solved using both RK4 and ode45 methods. The example solutions are shown below:

<p align="center">
  <img src="https://github.com/user-attachments/assets/9be67253-9700-40fc-9973-8cf73a4157e5" alt="Example Solution" width="1000">
</p>

The animation generated by the **ode45** method is shown below:

https://github.com/user-attachments/assets/e8ca3182-2022-4dbe-a167-56a892e8f1ed

---

## Task

The task is to implement the following:
1. **Runge-Kutta 4th Order (RK4)** method.
2. **MATLAB's ode45 function**.

### Goals
- Observe how initial conditions and physical values affect the system’s chaotic behavior.
- Compare the results and efficiency of the two numerical methods.


---

## Repository Structure

This repository is organized as follows:

1. **`animations/`**: Contains animations of the double pendulum motion generated for various initial and boundary conditions.

2. **`figures/`**: Contains solution plots and visualizations illustrating the double pendulum's behavior under different scenarios.

3. **`report/`**: Contains a detailed report explaining the mathematical model, methodology, and analysis of the results.

4. **`src/`**: Contains the MATLAB script for solving and simulating the double pendulum motion.

5. **`README.md`**: Provides an overview of the project, its objectives, and the repository structure.


---



## Derivation of the Equations

The equations of motion for the double pendulum are derived step by step in this section.

---

### Equations of Motion

The corresponding equations of motion for both masses are given below:

<p align="center">
  <img src="https://github.com/user-attachments/assets/06df0483-fd15-4249-aa86-bc8866ce21d1" alt="Equations of Motion for m1" width="350">
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/a7e3e1f4-8f4a-4563-bce3-f60f41d5d00d" alt="Equations of Motion for m2" width="350">
</p>

---

### Angular Transformations

The forces on m<sub>1</sub> and m<sub>2</sub> are transformed into angular form. After applying cosθ and sinθ transformations, the following equations are obtained:

<p align="center">
  <img src="https://github.com/user-attachments/assets/e379dd45-1575-48da-9ea1-aacb697f603c" alt="Angular Transformations 1" width="650">
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/8c3ac362-dee7-4510-b1e2-4fa90f18832c" alt="Angular Transformations 2" width="650">
</p>

---

### Coordinate Transformations

The Cartesian coordinates of the masses are related to the angles θ<sub>1</sub> and θ<sub>2</sub> as follows:

<p align="center">
  <img src="https://github.com/user-attachments/assets/e5c2e1af-4e24-4fb1-a579-13e67c7f8043" alt="Coordinate Transformations 1" width="350">
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/d258346f-dabb-447e-b40f-cbcb7434a376" alt="Coordinate Transformations 2" width="350">
</p>

---

### Reduced Mass

To simplify the system, a reduced mass term for the second bob is defined:

<p align="center">
  <img src="https://github.com/user-attachments/assets/4f329ba3-840d-4b23-bb4e-7282a6f88600" alt="Reduced Mass Definition" width="175">
</p>

---

### Coupled Equations

After applying the transformations and substitutions, the final equations of motion for θ<sub>1</sub> and θ<sub>2</sub> are:

<p align="center">
  <img src="https://github.com/user-attachments/assets/d3287307-8f71-4811-85a1-e557bdf2f56a" alt="Equations of Motion Theta1" width="575">
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/09afe392-ba9b-4e82-9bbd-59505c604592" alt="Equations of Motion Theta2" width="575">
</p>

### Linearized Equations

Using the relations derived from the angular transformations, the linearized equations for θ<sub>1</sub> and θ<sub>2</sub> can be expressed as follows:

<p align="center">
  <img src="https://github.com/user-attachments/assets/fa6667ce-2e53-4893-9fa1-608f0d4aace5" alt="Matrix Form" width="400">
</p>

Where:
- **A** is the coefficient matrix containing system properties.
- **B** is the driving force vector.

By multiplying the equations with the inverse of the A matrix, explicit forms for θ<sub>1</sub> and θ<sub>2</sub> can be written:

<p align="center">
  <img src="https://github.com/user-attachments/assets/343fc51a-ea42-4cfb-84fc-8b3aae5ef430" alt="Explicit Equations" width="500">
</p>

---

