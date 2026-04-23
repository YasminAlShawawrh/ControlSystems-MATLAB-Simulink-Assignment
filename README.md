# Control Systems — MATLAB & Simulink Assignment

MATLAB scripts and Simulink models for analyzing and designing unity feedback control systems. Covers step response analysis, second-order system metrics, pole analysis, block diagram simulation, root locus design, and PI controller compensation.


---

## Table of contents

- [Question 1 — Step response via script and Simulink](#question-1--step-response-via-script-and-simulink)
- [Question 2 — Second-order system metrics](#question-2--second-order-system-metrics)
- [Question 3 — Pole analysis](#question-3--pole-analysis)
- [Question 4 — Block diagram simulation](#question-4--block-diagram-simulation)
- [Question 5 — Root locus and PI controller design](#question-5--root-locus-and-pi-controller-design)
- [Tools used](#tools-used)
- [How to run](#how-to-run)

---

## Question 1 — Step response via script and Simulink

**System:** Unity feedback with forward path transfer function:

```
        1
G(s) = ───────
       s² + 3s
```

- MATLAB script: defines the closed-loop transfer function and plots the step response
- Simulink model: builds the same unity feedback system using blocks and obtains the step response graphically
- Both approaches produce identical results, confirming the model is correct

---

## Question 2 — Second-order system metrics

**System:** Unity feedback with forward path:

```
        9
G(s) = ──────
       s(s + 2)
```

Computes the following second-order system performance metrics from the closed-loop transfer function:

| Metric | Symbol | Description |
|---|---|---|
| Damping ratio | ζ | Describes oscillation decay |
| Natural frequency | ωn | Undamped natural frequency (rad/s) |
| Rise time | Tr | Time to first reach the final value |
| Settling time | Ts | Time to stay within ±2% of final value |
| Peak time | Tp | Time to reach the first peak |
| Overshoot | OS | Percentage the response exceeds the final value |

The script computes each value analytically from the closed-loop poles and also plots the step response curve for visual confirmation.

---

## Question 3 — Pole analysis

**System:** Unity feedback with forward path:

```
                  1
G(s) = ──────────────────────────────
       (s+3)(s+7)(s+9)(s+13)
```

- Computes the closed-loop poles of the unity feedback system using MATLAB
- Plots the pole-zero map to visualize system stability
- All poles located in the left-half plane confirms stability

---

## Question 4 — Block diagram simulation

**System:** A multi-loop feedback control system (see Figure 1 in the assignment PDF).

The block diagram contains:
- An outer unity feedback loop
- An inner feedback loop with gain `2s`
- A nested summing junction with gain `3`
- A plant block `1/(s+3)`

**Approach:**
1. Block diagram algebra by hand — reduces the multi-loop system to a single closed-loop transfer function
2. Simulink model — builds the exact block diagram from the figure and simulates the step response
3. MATLAB script — implements the reduced transfer function and plots the step response

All three methods produce the same step response curve.

---

## Question 5 — Root locus and PI controller design

**System:** Unity feedback with forward path:

```
              K
G(s) = ─────────────────────
       s(s²+2s+10)(s+15)
```

**Specifications:** 7% overshoot · Settling time = 0.9434 s

### Part 1 — Root locus plot
Plots the root locus of the uncompensated open-loop system using `rlocus()`.

### Part 2 — Desired pole and gain
- Computes the desired closed-loop pole from the overshoot and settling time specifications
- Locates the corresponding gain on the root locus
- **Result:** desired gain K ≈ 498

### Part 3 — PI controller design
Designs a PI controller so that:
- Steady-state error = 0 (PI integrator eliminates steady-state error)
- New settling time = 105% of original: `Ts,new = 1.05 × 0.9434 = 0.9906 s`

The PI controller zero is placed close to the origin to minimally affect the dominant poles while adding the integrator for zero steady-state error.

### Part 4 — Compensated vs uncompensated step response
Plots both systems on the same axes:

| System | Behavior |
|---|---|
| Uncompensated | Faster response but non-zero steady-state error |
| PI compensated | Slightly slower but achieves zero steady-state error |

### Part 5 — Simulink simulation
Builds and simulates both systems in Simulink:
- Uncompensated system (open loop and with unity feedback)
- PI compensated system (open loop and with unity feedback)

All four Simulink results are consistent with the MATLAB script plots.

---

## Tools used

| Tool | Purpose |
|---|---|
| MATLAB scripts | Transfer function definition, metric calculation, plotting |
| MATLAB Simulink | Block diagram modeling and step response simulation |
| Control System Toolbox | `tf()`, `feedback()`, `step()`, `rlocus()`, `pole()` |

---

## How to run

1. Open MATLAB (R2020a or later recommended)
2. Navigate to the assignment folder
3. Run each question script individually:

```matlab
% Q1
run('Q1_script.m')

% Q2
run('Q2_script.m')

% Q3
run('Q3_script.m')

% Q4
run('Q4_script.m')

% Q5 (all parts)
run('Q5_part1.m')
run('Q5_part2.m')
run('Q5_part3.m')
run('Q5_part4.m')
```

4. For Simulink models, open the `.slx` files directly in MATLAB and click **Run**

> Requires MATLAB Control System Toolbox for `tf()`, `feedback()`, `rlocus()`, and `pole()`.
