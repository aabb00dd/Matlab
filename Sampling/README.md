# Digital Signal Processing: Audio and Fourier Analysis

## Audio Signal Processing

### AudioSignal.m
- Records stereo audio input (10 seconds, 200kHz sampling rate)
- Features:
  - Records from both channels (stereo)
  - Visualizes:
    - Time-domain waveform
    - Spectrogram of the recorded signal
  - Playback functionality with `soundsc()`
  - Configurable parameters:
    - Sampling frequency (Fs)
    - Bit depth (nBits)
    - Recording duration (RecTime)

## Fourier Coefficient Analysis

### CoeffConvergence.m
- Demonstrates convergence of Fourier coefficients for a square wave
- Features:
  - Estimates ak coefficients using Discrete Fourier Series
  - Compares estimated values with theoretical values
  - Shows how estimation improves with increasing sample size (N)

### CoeffConvergence_hel.m
- Analyzes coefficient convergence for a half-wave rectified sine wave
- Features:
  - Implements Discrete Fourier Series estimation
  - Compares with theoretical values from Fourier analysis
  - Visualizes convergence behavior as N increases

### CoeffConvergence_triangel.m
- Examines coefficient convergence for a triangular wave
- Features:
  - Estimates Fourier coefficients numerically
  - Compares with analytical solution
  - Demonstrates convergence properties for triangular signals

## Sampling and Reconstruction

### Sampling.m
- Demonstrates sampling theorem and aliasing effects
- Features:
  - Generates and samples a sinusoidal signal
  - Creates:
    - Original continuous-time reference signal
    - Sampled discrete-time signal
    - Reconstructed signal (with potential aliasing)
  - Visualizations:
    - Time-domain comparison of all signals
    - Frequency spectrum (using FFT)
    - Both normalized and absolute frequency plots
  - Includes aliasing test cases

## Key Concepts Demonstrated
- Audio signal acquisition and analysis
- Discrete Fourier Series implementation
- Fourier coefficient estimation
- Convergence properties of Fourier series
- Sampling theorem verification
- Aliasing effects and reconstruction
- Time-domain vs frequency-domain analysis
- Signal visualization techniques

## License
This project is proprietary and not available for public modification or distribution.
