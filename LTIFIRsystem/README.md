# Digital Signal Processing: Filtering and LTI Systems

## Audio Filtering Scripts

### FilterAudio.m
- Records audio input (1 second, 48kHz sampling rate)
- Applies FIR filter from `filters.mat`
- Features:
  - Audio playback before/after filtering
  - Visualization of:
    - Filter coefficients (impulse response)
    - Frequency response (magnitude and phase)
    - Spectrograms of original and filtered signals

### FilterDemo.m
- Demonstrates noise reduction in audio signals
- Features:
  - Plays original, noisy, and filtered audio samples
  - Visualizes:
    - Filter coefficients
    - Frequency response
    - Spectrograms for comparison

### filters.mat
- Contains multiple FIR filter coefficient sets (h1-h7)
- Used by both filtering scripts

## LTI System Analysis Scripts

### LTIsystem.m
- Analyzes a 3-tap FIR filter (`b = [2 -(π-1) 2]`)
- Features:
  - Computes and plots frequency response (magnitude and phase)
  - Processes test signal with two frequency components
  - Compares convolution output with theoretical calculation

### LTIsystem_6_1.m
- Demonstrates a simple difference filter (`b = [1 2 1]`)
- Features:
  - Frequency response analysis
  - Single frequency component test
  - Comparison of convolution vs theoretical output

### LTIsystem_delay.m
- Shows a unit delay system (`b = [0 1]`)
- Features:
  - Frequency response of pure delay
  - Complex test signal processing
  - Verification of phase shift effects

### LTIsystem_running_sum.m
- Implements an 11-point moving average filter
- Features:
  - Low-pass filter characteristics
  - Frequency response analysis
  - Time-domain averaging demonstration

## Key Concepts Demonstrated
- FIR filter design and implementation
- Frequency response analysis
- Time-domain vs frequency-domain processing
- Audio signal processing
- Noise reduction techniques
- System identification through impulse response
- Convolution vs frequency domain multiplication


