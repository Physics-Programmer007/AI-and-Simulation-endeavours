# Gate Capacitance of MOSFET with Deep Neural Network

## Overview

This repository contains code for Gate Capacitance of MOSFET using a
deep neural network model. The model leverages the following equations
to make predictions:

1.  **Predicted Quantum Charge (Qinv_pred)**: Qinv_pred = q \* D \*
    phi_th \* (ln(1 + exp((Ef - E0p) / phi_th)) + ln(1 + exp((Ef - E1p)
    / phi_th)) + ln(1 + exp((Ef - E2p) / phi_th)))

2.  **Actual Quantum Charge (Qinv_actual)**: Qinv_actual = q \* D \*
    phi_th \* (ln(1 + exp((Ef - e0) / phi_th)) + ln(1 + exp((Ef - e1) /
    phi_th)) + ln(1 + exp((Ef - e2) / phi_th)))

3.  **Actual Gate Capacitance (Cgg_actual)**: Cgg_actual = ΔQinv_actual
    / Δvg_test1

4.  **Predicted Gate Capacitance (Cgg_pred)**: Cgg_pred = ΔQinv_pred /
    Δvg_test1

These equations are used in the code to predict the quantum charge and
capacitance values.

## Model Details

- The model is implemented as a deep neural network.
- It utilizes the hyperbolic tangent (tanh) activation function.
