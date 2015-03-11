%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Luke Hsiao & Travis Chambers
% ECEn 380 Lab 3
% 7 Oct 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;

% Using values from Lab 2
Rl = 8;
Rg = 82;
Rs = 50;
L = 4e-3;
C = 3.3e-6;

a1 = 1/(Rl*C)
a2 = 1/(L*C)
a3 = (1/(C*(Rs+Rg)))

%plot
figure(1);
w = logspace(1,6,1000);
freqs([a3, 0],[1, a1, a2],w);

% Find Frequency
[H, Wc] = freqs([a3, 0],[1, a1, a2],w);
[peak_level, index] = max(abs(H));
peak_freq = w(index)/(2*pi)
peak_level_dB = 20*log10(peak_level)


R1 = 1000;
R2 = 1000;
C1 = 470e-9;
C2 = 27e-9;

k1 = (1/(R1*C1) + 1/(R2*C2));
k2 = 1/(R1*R2*C1*C2);
k3 = 1/(R1*C2);


%plot
figure(2)
w = logspace(1,6,1000);
freqs([k3, 0],[1, k1, k2],w);

% Find Frequency
[H, Wc] = freqs([k3, 0],[1, k1, k2],w);
[peak_level, index] = max(abs(H));
peak_freq_2 = w(index)/(2*pi)
peak_level_dB_2 = 20*log10(peak_level)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Task 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w = 2*pi * 3000;
B = [0,0,w^2];
A = [1,0.7654*w,w^2];


figure(3)
hold on;
zplane(B,A);
A = [1, 1.8478*w, w^2];
zplane(B,A);
axis([-2e4, 2e4, -2e4, 2e4]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Task 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Using actual measured values
R1 = 1180;
R2 = 1180;
H1C1 = 134e-9;
H1C2 = 22e-9;
H2C1 = 54e-9;
H2C2 = 47e-9;
Wc = 2*pi*3000;

H1K1 = 0.7654*Wc;
H1K2 = Wc^2;
H1K3 = Wc^2;

H2K1 = 1.8478 * Wc;
H2K2 = Wc^2;
H2K3 = Wc^2;

k1 = (1/(R1*C1) + 1/(R2*C2));
k2 = 1/(R1*R2*C1*C2);
k3 = 1/(R1*C2);

%plot
figure(4);
w = logspace(1,6,1000);
freqs([0, H1K3],[1, H1K1, H1K2],w);
title('H1(s)')

figure(5);
freqs([0, H2K3],[1, H2K1, H2K2],w);
title('H2(s)')

figure(6);
v = [Wc*exp(-1j*5*pi/8) Wc*exp(1j*5*pi/8) Wc*exp(1j*7*pi/8) Wc*exp(-1j*7*pi/8)];
r = poly(v)
freqs([0, 0, 0, Wc^4], r, w);
title('Butterworth LowPass Filter');

