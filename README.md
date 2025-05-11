
# EECE 340 – Signals and Systems Final Project

Authors: Hawraa Khalil & Ruba El Houssami  
Date: April 2025

## Overview

This project explores fundamental and advanced concepts in signal processing through theoretical modeling, numerical simulations, and real-world application to whispered speech. Topics covered include:

- Fourier Series and its accuracy
- Continuous-Time Fourier Transform (CTFT) and Inverse
- Sampling, reconstruction, and aliasing
- Filtering (low-pass and band-pass FIR)
- Real-world whispered signal processing
- Noise robustness and system design insights

The report is organized into **three major parts**, with each part implemented in a dedicated folder.

---

## 📁 Code Directory Structure

```
├── 1/                            # Part 1: Fourier-Based Signal Representation
│   ├── 1.1/                      # Section 1.1: Fourier Series
│   │   ├── test.mlx              # Gaussian pulse and Sine wave approximation and plots, and varying n and t
│   │   ├── ffs.script            # Function for computing Fourier Series approximation
│   │   ├── compute_error.script  # function to compute the error
│
│   ├── 1.2/                     # Section 1.2: CTFT and Inverse
│       ├── ftr.script          # Fourier Transform function
│       ├── iftr.script         # Inverse CTFT function
│       ├── sinc.script         # function for sinc      
│       ├── test.mlx            # Gaussian, rectangular, sine signal tests for FFT vs trapeziodal

├── 2/                            # Part 2: Sampling, Aliasing, Reconstruction
│   ├── 2.1/                      # Section 2.1: Sampling
│   │   ├── sample_signal.script # Sampling function
│
│   ├── 2.2/                      # Section 2.2: Reconstruction
│   │   ├── reconstruct.script    # Sinc-based reconstruction function
│
│   ├── 2.3/                     # Section 2.3: Aliasing effects
│   │   ├── test.mlx             # Live script with plots and explanation
│
│   ├── 2.4/                      # Section 2.4: Error analysis
│   │   ├── test.mlx             # Live script with MSE and error metrics
│
│   ├── 2.5/                      # Section 2.5: Robustness testing
│   │   ├── test.mlx             # Live script with noise robustness and observations

├── 3/                            # Part 3: Whispered Signal Application
│   ├── 3.0/                      # Preprocessing
│   │   ├── preprocessing.mlx     # Loads, normalizes, and analyzes original whisper

│   ├── 3.1/                      # FIR Filtering
│   │   ├── lowpass_fir.script    # Function to design low-pass FIR filter
│   │   ├── bandpass_fir.script   # Function to design band-pass FIR filter
│   │   ├── lowpass.mlx           # Filtering analysis and plots for low-pass
│   │   ├── bandpass.mlx          # Filtering analysis and plots for band-pass

│   ├── 3.2/                      # Sampling + Reconstruction
│   │   ├── test.mlx              # Includes reconstructed signals at various rates

│   ├── 3.3/                      # Noise Robustness
│   │   ├── test.mlx              # Adds Gaussian noise and analyzes filter robustness

│   ├── audios/                   # Folder containing all audio waveforms
│   │   ├── whisper.wav
│   │   ├── whisper_filtered_lowpass.wav
│   │   ├── whisper_filtered_bandpass.wav
│   │   ├── reconstructed_original_noisy.wav
│   │   ├── reconstructed_lowpass_noisy.wav
│   │   ├── reconstructed_bandpass_noisy.wav

├── report.pdf                   # The full project report summarizing methods, results, and conclusions
---

## 📌 File Types

- `.script` files = MATLAB **functions** (e.g., `sample_signal.script`, `lowpass_fir.script`)
- `.mlx` files = MATLAB **live scripts** with visualizations, plots, and section-by-section simulations

---

## 🔬 How to Run

1. Open MATLAB
2. Navigate to the section folder (e.g., `cd 1/1.1`)
3. Run the `.mlx` file (e.g., `main_gaussian.mlx`)
4. Ensure paths to helper functions (e.g., `ffs.script`) are added with `addpath()` and that you are running the files in the correct directories

---

## 🧩 Division of Work

| Contributor     | Sections Implemented |
|-----------------|----------------------|
| Hawraa Khalil   | 1.1, 2.1, 2.2, 3.1, 3.2 |
| Ruba El Houssami | 1.2, 2.3–2.5, 3.3, 3.4 |
| Report          | Written collaboratively |

---

## 📄 Report

The full report is provided as `EECE_340_Project.pdf`.  
It includes:
- Theory and derivations
- Plot analysis
- Design insights and conclusions
- Linkage between code and experimental output

---

## 🎧 Real-World Signal

- Whispered sentence: “The signal is clear now.”
- Recorded using 48 kHz mono mic
- Filtered using low-pass and band-pass FIR designs
- Reconstruction and aliasing tested across 100 Hz, 8 kHz, and 20 kHz

---

## 📫 Contact

For any questions, please reach out to:

- **Hawraa Khalil** – hhk22@mail.aub.edu  
- **Ruba El Houssami** – rhe34@mail.aub.edu
