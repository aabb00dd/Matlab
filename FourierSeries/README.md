# Fourier Series Synthesis and Analysis

### 1. Square Wave
- **SquareSynthesis.m**: Synthesizes a square wave by adding Fourier components incrementally and plotting the result.
- **Squarecoeff.m**: Computes and plots the Fourier coefficients (ak) for a square wave in three different representations:
  - Coefficients with sign preserved
  - Absolute magnitude of coefficients
  - Magnitude spectrum with frequency in Hz

### 2. Half-Wave Rectified Sine Wave
- **Halvvagslikriktad_sinus.m**: Synthesizes a half-wave rectified sine wave and plots the reconstruction process.
- **Halvvagslikriktad_sinus_coeff.m**: Computes and plots the Fourier coefficients for a half-wave rectified sine wave in three representations.

### 3. Full-Wave Rectified Sine Wave
- **helvagslikriktad_sinusvag.m**: Synthesizes a full-wave rectified sine wave and visualizes the reconstruction.
- **helvagslikriktad_sinusvag_coeff.m**: Computes and plots the Fourier coefficients for a full-wave rectified sine wave in three representations.

### 4. Triangular Wave
- **triangelformad_signal.m**: Synthesizes a triangular wave and shows the reconstruction process.
- **triangelformad_signal_coeff.m**: Computes and plots the Fourier coefficients for a triangular wave in three representations.

## Common Features

All synthesis scripts:
- Start with the DC component (a0)
- Add harmonic components incrementally
- Plot the reconstructed signal over the original signal at each step
- Include a pause (0.25s) between steps for visualization

All coefficient analysis scripts:
- Compute coefficients for the specified waveform
- Create three types of plots:
  1. Coefficients with sign preserved
  2. Absolute magnitude of coefficients
  3. Magnitude spectrum with frequency in Hz
- Use consistent parameters:
  - T0 = 4 (signal period)
  - Time vector spans 3 periods for clear visualization

## License
This project is proprietary and not available for public modification or distribution.
