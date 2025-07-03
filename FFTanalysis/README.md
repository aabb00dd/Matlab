# Signal Processing and FFT Analysis

### 1. `DiskretSpektrum.m`
- **Description**: This script generates a pure sine wave and computes its discrete spectrum using FFT. It also demonstrates how to combine multiple sine waves with different frequencies, amplitudes, and phases, and then compute the spectrum of the resulting signal.
- **Key Features**:
  - Generates a pure sine wave.
  - Computes the FFT of the signal.
  - Plots the spectrum in terms of coefficient `k` and frequency in radians.
  - Combines multiple sine waves and computes their combined spectrum.

### 2. `DiskretSpektrum_modifierad.m`
- **Description**: This is a modified version of `DiskretSpektrum.m` that loads a signal from a `.mat` file and performs similar FFT analysis. It also includes the generation of multiple sine waves and their combined spectrum.
- **Key Features**:
  - Loads a signal from `signal.mat`.
  - Generates multiple sine waves with different frequencies, amplitudes, and phases.
  - Computes the FFT of the combined signal.
  - Plots the spectrum in terms of coefficient `k` and frequency in radians.

### 3. `LTIsystemFFT.m`
- **Description**: This script analyzes the frequency response of an LTI system using FFT. It computes the magnitude and phase response of the system and compares the output of the system with a reference signal.
- **Key Features**:
  - Defines an LTI system using FIR filter coefficients.
  - Computes the frequency response using FFT.
  - Plots the magnitude and phase response of the system.
  - Generates a test signal and compares the system output with a reference signal.

### 4. `LTIsystemFFT_6_1.m`
- **Description**: This script is similar to `LTIsystemFFT.m` but uses a different set of FIR filter coefficients. It also generates a test signal and compares the system output with a reference signal.
- **Key Features**:
  - Defines an LTI system using different FIR filter coefficients.
  - Computes the frequency response using FFT.
  - Plots the magnitude and phase response of the system.
  - Generates a test signal and compares the system output with a reference signal.

### 5. `LTIsystemFFT_delay.m`
- **Description**: This script analyzes the frequency response of an LTI system that introduces a delay. It computes the magnitude and phase response of the system and compares the output of the system with a reference signal.
- **Key Features**:
  - Defines an LTI system that introduces a delay.
  - Computes the frequency response using FFT.
  - Plots the magnitude and phase response of the system.
  - Generates a test signal and compares the system output with a reference signal.

### 6. `LTIsystemFFT_running_sum.m`
- **Description**: This script analyzes the frequency response of an LTI system that performs a running sum operation. It computes the magnitude and phase response of the system and compares the output of the system with a reference signal.
- **Key Features**:
  - Defines an LTI system that performs a running sum operation.
  - Computes the frequency response using FFT.
  - Plots the magnitude and phase response of the system.
  - Generates a test signal and compares the system output with a reference signal.

### 7. `signal.mat`
- **Description**: This file contains a pre-recorded signal that is used in `DiskretSpektrum_modifierad.m` for FFT analysis.
- **Usage**: Loaded in `DiskretSpektrum_modifierad.m` to perform spectral analysis.

