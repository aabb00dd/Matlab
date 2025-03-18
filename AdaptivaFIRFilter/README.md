# Adaptive Filtering Algorithms in MATLAB

### 1. `lms.m`
- **Description**: Implements the Widrow-Hoff LMS adaptive filtering algorithm.
- **Usage**: `[A, E] = lms(x, d, mu, nord, a0)`
  - `x`: Input data to the adaptive filter.
  - `d`: Desired output.
  - `mu`: Step-size parameter.
  - `nord`: Number of filter coefficients.
  - `a0`: (Optional) Initial guess for FIR filter coefficients.
- **Outputs**:
  - `A`: Matrix containing filter coefficients over time.
  - `E`: Error sequence versus time.

### 2. `nlms.m`
- **Description**: Implements the Normalized LMS adaptive filtering algorithm.
- **Usage**: `[A, E] = nlms(x, d, beta, nord, a0)`
  - `x`: Input data to the adaptive filter.
  - `d`: Desired output.
  - `beta`: Step-size parameter.
  - `nord`: Number of filter coefficients.
  - `a0`: (Optional) Initial guess for FIR filter coefficients.
- **Outputs**:
  - `A`: Matrix containing filter coefficients over time.
  - `E`: Error sequence versus time.

### 3. `llms.m`
- **Description**: Implements the Leaky LMS adaptive filtering algorithm.
- **Usage**: `[A, E] = llms(x, d, mu, gamma, nord, a0)`
  - `x`: Input data to the adaptive filter.
  - `d`: Desired output.
  - `mu`: Step-size parameter.
  - `gamma`: Leaky term.
  - `nord`: Number of filter coefficients.
  - `a0`: (Optional) Initial guess for FIR filter coefficients.
- **Outputs**:
  - `A`: Matrix containing filter coefficients over time.
  - `E`: Error sequence versus time.

### 4. `WienerHopf.m`
- **Description**: Computes the optimal FIR filter weights using the Wiener-Hopf equations.
- **Usage**: `[w, Emin] = WienerHopf(x, d, P)`
  - `x`: Input signal.
  - `d`: Desired signal.
  - `P`: Number of filter coefficients.
- **Outputs**:
  - `w`: Optimal filter weights.
  - `Emin`: Minimum mean-square error.

### 5. `TestOptimalfilt.m`
- **Description**: A test script that demonstrates the use of the LMS, NLMS, and LLMS algorithms for adaptive filtering. It generates a random input signal, applies a known filter, and then uses the adaptive filters to estimate the original filter coefficients.
- **Usage**: Run the script to see the performance of the LMS, NLMS, and LLMS algorithms in terms of filter coefficient convergence and error minimization.

## License
This project is proprietary and not available for public modification or distribution.
