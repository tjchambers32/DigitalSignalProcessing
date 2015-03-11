% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % ECEn 380 | Lab 5
% % Luke Hsiao & Travis Chambers
% % 18 November 2014
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %%%%%%%%%%%%%%% Task 1 %%%%%%%%%%%%%%%%%%%%%%%%%%
%  clear all;
%  close all;
% % 
% % N = 51;
% % 
% % %Chebyshev Window
% % figure(1);
% % hold on;
% % cheb = chebwin(N, 100);
% % plot(cheb,'-');
% % 
% % %Tukey Window
% % tukey = tukeywin(N,1);
% % plot(tukey,'--');
% % 
% % %Bohman Window
% % bohman = bohmanwin(N);
% % plot(bohman,':');
% % 
% % legend('Chebyshev Window', 'Tukey Window', 'Bohman Window');
% % title('Selected MATLAB Windows');
% % hold off;
% % 
% % figure(2);
% % hold on
% % [H, W] = freqz(cheb);
% % peak = max(abs(H));
% % plot(W, 20*log10(abs(H)/peak));
% % 
% % [H, W] = freqz(tukey);
% % peak = max(abs(H));
% % plot(W, 20*log10(abs(H)/peak));
% % 
% % [H, W] = freqz(bohman);
% % peak = max(abs(H));
% % plot(W, 20*log10(abs(H)/peak));
% % 
% % legend('Chebyshev DFT', 'Tukey DFT', 'Bohman DFT');
% % title('Selected MATLAB DFTs');
% 
% 
% 
% 
% 
% 
% 
% F0 = 0.20; % center frequency (cycles/sample)
% B = 0.05; % bandwidith (cycles/sample)
% 
% L = 51; % the length parameter L
% N = 2*L+1; % the filter length
% n = (-L:L)'; % the sample index
% hideal = 2*B*cos(2*pi*F0*n).*sinc(B*n);
% h0 = chebwin(N).*hideal; % chebyshev window
% h1 = tukeywin(N).*hideal; % tukey window
% h2 = bohmanwin(N).*hideal; % bohman window
% 
% Nd = 2048; % number of points around unit circle
% FF = -0.5:1/Nd:0.5-1/Nd; % frequency axis for DFT plots
% H0 = freqz(h0,1,Nd,'whole'); % DFT of h0
% H1 = freqz(h1,1,Nd,'whole'); % DFT of h1
% H2 = freqz(h2,1,Nd,'whole'); % DFT of h2
% 
% % plot H0 and H1 in dB
% % and zoom in on the passband
% 
% subplot(2,1,1)
% plot(FF,20*log10(abs(fftshift(H0))),'b-', ...
%      FF,20*log10(abs(fftshift(H1))),'b--', ...
%      FF,20*log10(abs(fftshift(H2))),'b:');
% grid on;
% xlabel('frequency (cycles/sample)');
% ylabel('magnitude (dB)');
% axis([0.1 0.30 -60 5]);
% set(gca,'XTick',[0.1 0.15 0.2 0.25 0.3]);
% legend('Chebyshev Window','Tukey Window','Bohman Window');
% title('Zoomed in on Peak');
% 
% subplot(2,1,2)
% plot(FF,20*log10(abs(fftshift(H0))),'b-', ...
%      FF,20*log10(abs(fftshift(H1))),'b--', ...
%      FF,20*log10(abs(fftshift(H2))),'b:');
% grid on;
% axis([0.0 0.4 -150 5]);
% xlabel('frequency (cycles/sample)');
% ylabel('magnitude (dB)');
% legend('Chebyshev Window','Tukey Window','Bohman Window');
% title('Overall Shape');
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Part 2A
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% F0 = 0.20; % center frequency (cycles/sample)
% B0 = 0.002; % bandwidith 
% B1 = 0.005;
% B2 = 0.02;
% 
% L = 501; % the length parameter L
% N = 2*L+1; % the filter length
% n = (-L:L)'; % the sample index
% hideal0 = 2*B0*cos(2*pi*F0*n).*sinc(B0*n);
% hideal1 = 2*B1*cos(2*pi*F0*n).*sinc(B1*n);
% hideal2 = 2*B2*cos(2*pi*F0*n).*sinc(B2*n);
% w0 = chebwin(N).*hideal0; % chebyshev window
% w1 = chebwin(N).*hideal1;
% w2 = chebwin(N).*hideal2;
% 
% Nd = 2048; % number of points around unit circle
% FF = -0.5:1/Nd:0.5-1/Nd; % frequency axis for DFT plots
% 
% W0 = freqz(w0,1,Nd,'whole'); % DFT of w0
% W1 = freqz(w1,1,Nd,'whole'); % DFT of w1
% W2 = freqz(w2,1,Nd,'whole'); % DFT of w2
% 
% figure(2);
% plot(FF,20*log10(abs(fftshift(W0))),'b-', ...
%      FF,20*log10(abs(fftshift(W1))),'b--', ...
%      FF,20*log10(abs(fftshift(W2))),'b-.');
% 
% grid on;
% axis([0.1 0.30 -80 10]);
% xlabel('frequency (cycles/sample)');
% ylabel('magnitude (dB)');
% legend('B = 0.002','B = 0.005','B = 0.02');
% title('Chebyshev Window at Selected Bandwidths');
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Part 2B
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% F0 = 0.20; % center frequency (cycles/sample)
% B0 = 0.01;  % Bandwidth in cycles/sample
% 
% L0 = 101;
% L1 = 501; % the length parameter L
% L2 = 1001;
% N0 = 2*L0+1; % the filter length
% N1 = 2*L1+1;
% N2 = 2*L2+1;
% n0 = (-L0:L0)'; % the sample index
% n1 = (-L1:L1)';
% n2 = (-L2:L2)';
% hideal0 = 2*B0*cos(2*pi*F0*n0).*sinc(B0*n0);
% hideal1 = 2*B0*cos(2*pi*F0*n1).*sinc(B0*n1);
% hideal2 = 2*B0*cos(2*pi*F0*n2).*sinc(B0*n2);
% w0 = chebwin(N0).*hideal0; % chebyshev window
% w1 = chebwin(N1).*hideal1;
% w2 = chebwin(N2).*hideal2;
% 
% Nd = 2048; % number of points around unit circle
% FF = -0.5:1/Nd:0.5-1/Nd; % frequency axis for DFT plots
% 
% W0 = freqz(w0,1,Nd,'whole'); % DFT of w0
% W1 = freqz(w1,1,Nd,'whole'); % DFT of w1
% W2 = freqz(w2,1,Nd,'whole'); % DFT of w2
% 
% figure(3);
% plot(FF,20*log10(abs(fftshift(W0))),'b-', ...
%      FF,20*log10(abs(fftshift(W1))),'b--', ...
%      FF,20*log10(abs(fftshift(W2))),'b-.');
% 
% grid on;
% axis([0.1 0.30 -80 10]);
% xlabel('frequency (cycles/sample)');
% ylabel('magnitude (dB)');
% legend('Length 101','Length 501','Length 1001');
% title('Chebyshev Window at Selected Lengths');
% 
% 
% clear all;
% close all;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Part 3
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% F0 = .20; % center frequency (cycles/sample)
% F1 = .22; % center frequency (cycles/sample)
% F2 = .24; % center frequency (cycles/sample)
% F3 = .26; % center frequency (cycles/sample)
% F4 = .28; % center frequency (cycles/sample)
% F5 = .30; % center frequency (cycles/sample)
% F6 = .32; % center frequency (cycles/sample)
% F7 = .34; % center frequency (cycles/sample)
% F8 = .36; % center frequency (cycles/sample)
% F9 = .38; % center frequency (cycles/sample)
% 
% B0 = .01;  % Bandwidth in cycles/sample
% 
% L0 = 501; % the length parameter L
% N0 = 2*L0+1; % the filter length
% n0 = (-L0:L0)'; % the sample index
% 
% hideal0 = 2*B0*cos(2*pi*F0*n0).*sinc(B0*n0);
% hideal1 = 2*B0*cos(2*pi*F1*n0).*sinc(B0*n0);
% hideal2 = 2*B0*cos(2*pi*F2*n0).*sinc(B0*n0);
% hideal3 = 2*B0*cos(2*pi*F3*n0).*sinc(B0*n0);
% hideal4 = 2*B0*cos(2*pi*F4*n0).*sinc(B0*n0);
% hideal5 = 2*B0*cos(2*pi*F5*n0).*sinc(B0*n0);
% hideal6 = 2*B0*cos(2*pi*F6*n0).*sinc(B0*n0);
% hideal7 = 2*B0*cos(2*pi*F7*n0).*sinc(B0*n0);
% hideal8 = 2*B0*cos(2*pi*F8*n0).*sinc(B0*n0);
% hideal9 = 2*B0*cos(2*pi*F9*n0).*sinc(B0*n0);
% 
% w0 = chebwin(N0).*hideal0; % chebyshev window
% w1 = chebwin(N0).*hideal1;
% w2 = chebwin(N0).*hideal2;
% w3 = chebwin(N0).*hideal3;
% w4 = chebwin(N0).*hideal4;
% w5 = chebwin(N0).*hideal5;
% w6 = chebwin(N0).*hideal6;
% w7 = chebwin(N0).*hideal7;
% w8 = chebwin(N0).*hideal8;
% w9 = chebwin(N0).*hideal9;
% 
% Nd = 2048; % number of points around unit circle
% FF = -.5:1/Nd:.5-1/Nd; % frequency axis for DFT plots
% 
% W0 = freqz(w0,1,Nd,'whole'); % DFT of w0
% W1 = freqz(w1,1,Nd,'whole'); % DFT of w1
% W2 = freqz(w2,1,Nd,'whole'); % DFT of w2
% W3 = freqz(w3,1,Nd,'whole'); % DFT of w3
% W4 = freqz(w4,1,Nd,'whole'); % DFT of w4
% W5 = freqz(w5,1,Nd,'whole'); % DFT of w5
% W6 = freqz(w6,1,Nd,'whole'); % DFT of w6
% W7 = freqz(w7,1,Nd,'whole'); % DFT of w7
% W8 = freqz(w8,1,Nd,'whole'); % DFT of w8
% W9 = freqz(w9,1,Nd,'whole'); % DFT of w9
% 
% figure(4);
% plot(FF,20*log10(abs(fftshift(W0))),'b', ...
%      FF,20*log10(abs(fftshift(W1))),'b', ...
%      FF,20*log10(abs(fftshift(W2))),'b', ...
%      FF,20*log10(abs(fftshift(W3))),'b', ...
%      FF,20*log10(abs(fftshift(W4))),'b', ...
%      FF,20*log10(abs(fftshift(W5))),'b', ...
%      FF,20*log10(abs(fftshift(W6))),'b', ...
%      FF,20*log10(abs(fftshift(W7))),'b', ...
%      FF,20*log10(abs(fftshift(W8))),'b', ...
%      FF,20*log10(abs(fftshift(W9))),'b');
%  
% grid on;
% axis([.19 0.39 -80 10]);
% xlabel('frequency (cycles/sample)');
% ylabel('magnitude (dB)');
% title('Bank of 10 Filters');
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Part 4
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% easy1 = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5easy1.mat');
% r0 = conv(easy1.x,w0);
% r1 = conv(easy1.x,w1);
% r2 = conv(easy1.x,w2);
% r3 = conv(easy1.x,w3);
% r4 = conv(easy1.x,w4);
% r5 = conv(easy1.x,w5);
% r6 = conv(easy1.x,w6);
% r7 = conv(easy1.x,w7);
% r8 = conv(easy1.x,w8);
% r9 = conv(easy1.x,w9);
% 
% e0 = energy(r0);
% e1 = energy(r1);
% e2 = energy(r2);
% e3 = energy(r3);
% e4 = energy(r4);
% e5 = energy(r5);
% e6 = energy(r6);
% e7 = energy(r7);
% e8 = energy(r8);
% e9 = energy(r9);
% 
% energies = [e0, e1, e2, e3, e4, e5, e6, e7, e8, e9];
% [val, easy1_shooter] = max(energies)
% 
% easy2 = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5easy2.mat');
% r0 = conv(easy2.x,w0);
% r1 = conv(easy2.x,w1);
% r2 = conv(easy2.x,w2);
% r3 = conv(easy2.x,w3);
% r4 = conv(easy2.x,w4);
% r5 = conv(easy2.x,w5);
% r6 = conv(easy2.x,w6);
% r7 = conv(easy2.x,w7);
% r8 = conv(easy2.x,w8);
% r9 = conv(easy2.x,w9);
% 
% e0 = energy(r0);
% e1 = energy(r1);
% e2 = energy(r2);
% e3 = energy(r3);
% e4 = energy(r4);
% e5 = energy(r5);
% e6 = energy(r6);
% e7 = energy(r7);
% e8 = energy(r8);
% e9 = energy(r9);
% 
% energies = [e0, e1, e2, e3, e4, e5, e6, e7, e8, e9];
% [val, easy2_shooter] = max(energies)
% 
% easy3 = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5easy3.mat');
% r0 = conv(easy3.x,w0);
% r1 = conv(easy3.x,w1);
% r2 = conv(easy3.x,w2);
% r3 = conv(easy3.x,w3);
% r4 = conv(easy3.x,w4);
% r5 = conv(easy3.x,w5);
% r6 = conv(easy3.x,w6);
% r7 = conv(easy3.x,w7);
% r8 = conv(easy3.x,w8);
% r9 = conv(easy3.x,w9);
% 
% e0 = energy(r0);
% e1 = energy(r1);
% e2 = energy(r2);
% e3 = energy(r3);
% e4 = energy(r4);
% e5 = energy(r5);
% e6 = energy(r6);
% e7 = energy(r7);
% e8 = energy(r8);
% e9 = energy(r9);
% 
% energies = [e0, e1, e2, e3, e4, e5, e6, e7, e8, e9];
% [val, easy3_shooter] = max(energies)
% 
% easy4 = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5easy4.mat');
% r0 = conv(easy4.x,w0);
% r1 = conv(easy4.x,w1);
% r2 = conv(easy4.x,w2);
% r3 = conv(easy4.x,w3);
% r4 = conv(easy4.x,w4);
% r5 = conv(easy4.x,w5);
% r6 = conv(easy4.x,w6);
% r7 = conv(easy4.x,w7);
% r8 = conv(easy4.x,w8);
% r9 = conv(easy4.x,w9);
% 
% e0 = energy(r0);
% e1 = energy(r1);
% e2 = energy(r2);
% e3 = energy(r3);
% e4 = energy(r4);
% e5 = energy(r5);
% e6 = energy(r6);
% e7 = energy(r7);
% e8 = energy(r8);
% e9 = energy(r9);
% 
% energies = [e0, e1, e2, e3, e4, e5, e6, e7, e8, e9];
% [val, easy4_shooter] = max(energies)
% 
% easy5 = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5easy5.mat');
% r0 = conv(easy5.x,w0);
% r1 = conv(easy5.x,w1);
% r2 = conv(easy5.x,w2);
% r3 = conv(easy5.x,w3);
% r4 = conv(easy5.x,w4);
% r5 = conv(easy5.x,w5);
% r6 = conv(easy5.x,w6);
% r7 = conv(easy5.x,w7);
% r8 = conv(easy5.x,w8);
% r9 = conv(easy5.x,w9);
% 
% e0 = energy(r0);
% e1 = energy(r1);
% e2 = energy(r2);
% e3 = energy(r3);
% e4 = energy(r4);
% e5 = energy(r5);
% e6 = energy(r6);
% e7 = energy(r7);
% e8 = energy(r8);
% e9 = energy(r9);
% 
% energies = [e0, e1, e2, e3, e4, e5, e6, e7, e8, e9];
% [val, easy5_shooter] = max(energies)
% 
% hard1 = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5hard1.mat');
% r0 = conv(hard1.x,w0);
% r1 = conv(hard1.x,w1);
% r2 = conv(hard1.x,w2);
% r3 = conv(hard1.x,w3);
% r4 = conv(hard1.x,w4);
% r5 = conv(hard1.x,w5);
% r6 = conv(hard1.x,w6);
% r7 = conv(hard1.x,w7);
% r8 = conv(hard1.x,w8);
% r9 = conv(hard1.x,w9);
% 
% e0 = energy(r0);
% e1 = energy(r1);
% e2 = energy(r2);
% e3 = energy(r3);
% e4 = energy(r4);
% e5 = energy(r5);
% e6 = energy(r6);
% e7 = energy(r7);
% e8 = energy(r8);
% e9 = energy(r9);
% 
% energies = [e0, e1, e2, e3, e4, e5, e6, e7, e8, e9];
% [val, hard1_shooter] = max(energies)
% 
% hard2 = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5hard2.mat');
% r0 = conv(hard2.x,w0);
% r1 = conv(hard2.x,w1);
% r2 = conv(hard2.x,w2);
% r3 = conv(hard2.x,w3);
% r4 = conv(hard2.x,w4);
% r5 = conv(hard2.x,w5);
% r6 = conv(hard2.x,w6);
% r7 = conv(hard2.x,w7);
% r8 = conv(hard2.x,w8);
% r9 = conv(hard2.x,w9);
% 
% e0 = energy(r0);
% e1 = energy(r1);
% e2 = energy(r2);
% e3 = energy(r3);
% e4 = energy(r4);
% e5 = energy(r5);
% e6 = energy(r6);
% e7 = energy(r7);
% e8 = energy(r8);
% e9 = energy(r9);
% 
% energies = [e0, e1, e2, e3, e4, e5, e6, e7, e8, e9];
% [val, hard2_shooter] = max(energies)
% 
% hard3 = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5hard3.mat');
% r0 = conv(hard3.x,w0);
% r1 = conv(hard3.x,w1);
% r2 = conv(hard3.x,w2);
% r3 = conv(hard3.x,w3);
% r4 = conv(hard3.x,w4);
% r5 = conv(hard3.x,w5);
% r6 = conv(hard3.x,w6);
% r7 = conv(hard3.x,w7);
% r8 = conv(hard3.x,w8);
% r9 = conv(hard3.x,w9);
% 
% e0 = energy(r0);
% e1 = energy(r1);
% e2 = energy(r2);
% e3 = energy(r3);
% e4 = energy(r4);
% e5 = energy(r5);
% e6 = energy(r6);
% e7 = energy(r7);
% e8 = energy(r8);
% e9 = energy(r9);
% 
% energies = [e0, e1, e2, e3, e4, e5, e6, e7, e8, e9];
% [val, hard3_shooter] = max(energies)
% 
% hard4 = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5hard4.mat');
% r0 = conv(hard4.x,w0);
% r1 = conv(hard4.x,w1);
% r2 = conv(hard4.x,w2);
% r3 = conv(hard4.x,w3);
% r4 = conv(hard4.x,w4);
% r5 = conv(hard4.x,w5);
% r6 = conv(hard4.x,w6);
% r7 = conv(hard4.x,w7);
% r8 = conv(hard4.x,w8);
% r9 = conv(hard4.x,w9);
% 
% e0 = energy(r0);
% e1 = energy(r1);
% e2 = energy(r2);
% e3 = energy(r3);
% e4 = energy(r4);
% e5 = energy(r5);
% e6 = energy(r6);
% e7 = energy(r7);
% e8 = energy(r8);
% e9 = energy(r9);
% 
% energies = [e0, e1, e2, e3, e4, e5, e6, e7, e8, e9];
% [val, hard4_shooter] = max(energies)
% 
% hard5 = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5hard5.mat');
% r0 = conv(hard5.x,w0);
% r1 = conv(hard5.x,w1);
% r2 = conv(hard5.x,w2);
% r3 = conv(hard5.x,w3);
% r4 = conv(hard5.x,w4);
% r5 = conv(hard5.x,w5);
% r6 = conv(hard5.x,w6);
% r7 = conv(hard5.x,w7);
% r8 = conv(hard5.x,w8);
% r9 = conv(hard5.x,w9);
% 
% e0 = energy(r0);
% e1 = energy(r1);
% e2 = energy(r2);
% e3 = energy(r3);
% e4 = energy(r4);
% e5 = energy(r5);
% e6 = energy(r6);
% e7 = energy(r7);
% e8 = energy(r8);
% e9 = energy(r9);
% 
% energies = [e0, e1, e2, e3, e4, e5, e6, e7, e8, e9];
% [val, hard5_shooter] = max(energies)
% 
% %Plotting all outputs
% figure(6);
% N = 1000;
% FF = -.5:1/N:.5-1/N; % frequency axis for DFT plots
% 
% easy1 = pwelch(easy1.x, rectwin(N), 0, N, 'twosided');
% easy2 = pwelch(easy2.x, rectwin(N), 0, N, 'twosided');
% easy3 = pwelch(easy3.x, rectwin(N), 0, N, 'twosided');
% easy4 = pwelch(easy4.x, rectwin(N), 0, N, 'twosided');
% easy5 = pwelch(easy5.x, rectwin(N), 0, N, 'twosided');
% 
% hard1 = pwelch(hard1.x, rectwin(N), 0, N, 'twosided');
% hard2 = pwelch(hard2.x, rectwin(N), 0, N, 'twosided');
% hard3 = pwelch(hard3.x, rectwin(N), 0, N, 'twosided');
% hard4 = pwelch(hard4.x, rectwin(N), 0, N, 'twosided');
% hard5 = pwelch(hard5.x, rectwin(N), 0, N, 'twosided');
% 
% subplot(5,2,1);
% plot(FF, 10*log10(abs(fftshift(easy1))));
% grid on;
% xlabel('frequency(cycles/sample)');
% ylabel('magnitude (dB)');
% title('Easy 1 Signal');
% axis([.19 0.39 -45 0]);
% 
% subplot(5,2,3);
% plot(FF, 10*log10(abs(fftshift(easy2))));
% grid on;
% xlabel('frequency(cycles/sample)');
% ylabel('magnitude (dB)');
% title('Easy 2 Signal');
% axis([.19 0.39 -45 0]);
% 
% subplot(5,2,5);
% plot(FF, 10*log10(abs(fftshift(easy3))));
% grid on;
% xlabel('frequency(cycles/sample)');
% ylabel('magnitude (dB)');
% title('Easy 3 Signal');
% axis([.19 0.39 -45 0]);
% 
% subplot(5,2,7);
% plot(FF, 10*log10(abs(fftshift(easy4))));
% grid on;
% xlabel('frequency(cycles/sample)');
% ylabel('magnitude (dB)');
% title('Easy 4 Signal');
% axis([.19 0.39 -45 0]);
% 
% subplot(5,2,9);
% plot(FF, 10*log10(abs(fftshift(easy5))));
% grid on;
% xlabel('frequency(cycles/sample)');
% ylabel('magnitude (dB)');
% title('Easy 5 Signal');
% axis([.19 0.39 -45 0]);
% 
% subplot(5,2,2);
% plot(FF, 10*log10(abs(fftshift(hard1))));
% grid on;
% xlabel('frequency(cycles/sample)');
% ylabel('magnitude (dB)');
% title('Hard 1 Signal');
% axis([.19 0.39 -45 0]);
% 
% subplot(5,2,4);
% plot(FF, 10*log10(abs(fftshift(hard2))));
% grid on;
% xlabel('frequency(cycles/sample)');
% ylabel('magnitude (dB)');
% title('Hard 2 Signal');
% axis([.19 0.39 -45 0]);
% 
% subplot(5,2,6);
% plot(FF, 10*log10(abs(fftshift(hard3))));
% grid on;
% xlabel('frequency(cycles/sample)');
% ylabel('magnitude (dB)');
% title('Hard 3 Signal');
% axis([.19 0.39 -45 0]);
% 
% subplot(5,2,8);
% plot(FF, 10*log10(abs(fftshift(hard4))));
% grid on;
% xlabel('frequency(cycles/sample)');
% ylabel('magnitude (dB)');
% title('Hard 4 Signal');
% axis([.19 0.39 -45 0]);
% 
% subplot(5,2,10);
% plot(FF, 10*log10(abs(fftshift(hard5))));
% grid on;
% xlabel('frequency(cycles/sample)');
% ylabel('magnitude (dB)');
% title('Hard 5 Signal');
% axis([.19 0.39 -45 0]);

%%%%%%%%%%%%%%% End Task 1 %%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%% Task 2 %%%%%%%%%%%%%%%%%%%%%%%%
close all;
% clear all
% Task 2 Part 1a
n = 3;
W0 = 2*pi*.2; %BPF center frequency
Wc1 = 2*pi*.01; 
Wc2 = 2*pi*.02;
Wc3 = 2*pi*.05;

[b1,a1] = butter(n, Wc1/pi);

a1plus = a1.*exp(1i*W0*(0:n));
b1plus = b1.*exp(1i*W0*(0:n));
a1minus = a1.*exp(-1i*W0*(0:n));
b1minus = b1.*exp(-1i*W0*(0:n));

bb1 = conv(b1plus,a1minus) + conv(b1minus,a1plus);
aa1 = conv(a1plus,a1minus);
aa1 = real(aa1);

N = 1024; %number of points on a unit circle
FF = -0.5:1/N:0.5-1/N; % frequency axis for DFT plots

H_bpf1 = freqz(bb1,aa1,N,'whole');


[b2,a2] = butter(n, Wc2/pi);

a2plus = a2.*exp(1i*W0*(0:n));
b2plus = b2.*exp(1i*W0*(0:n));
a2minus = a2.*exp(-1i*W0*(0:n));
b2minus = b2.*exp(-1i*W0*(0:n));
bb2 = conv(b2plus,a2minus) + conv(b2minus,a2plus);
aa2 = conv(a2plus,a2minus);
aa2 = real(aa2);
H_bpf2 = freqz(bb2,aa2,N,'whole');

[b3,a3] = butter(n, Wc3/pi);

a3plus = a3.*exp(1i*W0*(0:n));
b3plus = b3.*exp(1i*W0*(0:n));
a3minus = a3.*exp(-1i*W0*(0:n));
b3minus = b3.*exp(-1i*W0*(0:n));
bb3 = conv(b3plus,a3minus) + conv(b3minus,a3plus);
aa3 = conv(a3plus,a3minus);
aa3 = real(aa3);
H_bpf3 = freqz(bb3,aa3,N,'whole');

% Plot Everything

hold on
figure(7);

plot(FF,20*log10(abs(fftshift(H_bpf1))), 'b-', ...
     FF,20*log10(abs(fftshift(H_bpf2))), 'b--',...
     FF,20*log10(abs(fftshift(H_bpf3))), 'b-.');
 
grid on;
xlabel('frequency (cycles/sample)');
ylabel('magnitude (dB)');
axis([-0.5 0.5 -60 3]);
legend('W = 2pi* 0.01','W = 2pi* 0.02','W = 2pi* 0.05');

%%%%%%%%%%%%%%%%% Task 2 Part B %%%%%%%%%%%%%%%%%%%%%
n0 = 1;
n1 = 3;
n2 = 5;

W0 = 2*pi*.2; %BPF center frequency
Wc1 = 2*pi*.02; %Bandwidth

[b2,a2] = butter(n0, Wc1/pi);

a2plus = a2.*exp(1i*W0*(0:n0));
b2plus = b2.*exp(1i*W0*(0:n0));
a2minus = a2.*exp(-1i*W0*(0:n0));
b2minus = b2.*exp(-1i*W0*(0:n0));
bb2 = conv(b2plus,a2minus) + conv(b2minus,a2plus);
aa2 = conv(a2plus,a2minus);
aa2 = real(aa2);
H_bpf1 = freqz(bb2,aa2,N,'whole');

[b2,a2] = butter(n1, Wc1/pi);

a2plus = a2.*exp(1i*W0*(0:n1));
b2plus = b2.*exp(1i*W0*(0:n1));
a2minus = a2.*exp(-1i*W0*(0:n1));
b2minus = b2.*exp(-1i*W0*(0:n1));
bb2 = conv(b2plus,a2minus) + conv(b2minus,a2plus);
aa2 = conv(a2plus,a2minus);
aa2 = real(aa2);
H_bpf2 = freqz(bb2,aa2,N,'whole');

[b2,a2] = butter(n2, Wc1/pi);

a2plus = a2.*exp(1i*W0*(0:n2));
b2plus = b2.*exp(1i*W0*(0:n2));
a2minus = a2.*exp(-1i*W0*(0:n2));
b2minus = b2.*exp(-1i*W0*(0:n2));
bb2 = conv(b2plus,a2minus) + conv(b2minus,a2plus);
aa2 = conv(a2plus,a2minus);
aa2 = real(aa2);
H_bpf3 = freqz(bb2,aa2,N,'whole');

figure(8);
plot(FF,20*log10(abs(fftshift(H_bpf1))), 'b-', ...
     FF,20*log10(abs(fftshift(H_bpf2))), 'b--',...
     FF,20*log10(abs(fftshift(H_bpf3))), 'b-.');

grid on;
xlabel('frequency (cycles/sample)');
ylabel('magnitude (dB)');
axis([-0.5 0.5 -60 3]);
legend('2nd Order','6th Order','10th Order');

%%%%%%%%%%%%%%%%% Task 2 Part 2 %%%%%%%%%%%%%%%%%%%%

W0 = 2*pi*.20; % center frequency (cycles/sample)
W1 = 2*pi*.22; % center frequency (cycles/sample)
W2 = 2*pi*.24; % center frequency (cycles/sample)
W3 = 2*pi*.26; % center frequency (cycles/sample)
W4 = 2*pi*.28; % center frequency (cycles/sample)
W5 = 2*pi*.30; % center frequency (cycles/sample)
W6 = 2*pi*.32; % center frequency (cycles/sample)
W7 = 2*pi*.34; % center frequency (cycles/sample)
W8 = 2*pi*.36; % center frequency (cycles/sample)
W9 = 2*pi*.38; % center frequency (cycles/sample)

n = 7; %14th order
Wc1 = 2*pi*.003; %Bandwidth

[b0,a0] = butter(n, Wc1/pi);
[b1,a1] = butter(n, Wc1/pi);
[b2,a2] = butter(n, Wc1/pi);
[b3,a3] = butter(n, Wc1/pi);
[b4,a4] = butter(n, Wc1/pi);
[b5,a5] = butter(n, Wc1/pi);
[b6,a6] = butter(n, Wc1/pi);
[b7,a7] = butter(n, Wc1/pi);
[b8,a8] = butter(n, Wc1/pi);
[b9,a9] = butter(n, Wc1/pi);

a0plus = a0.*exp(1i*W0*(0:n));
b0plus = b0.*exp(1i*W0*(0:n));
a0minus = a0.*exp(-1i*W0*(0:n));
b0minus = b0.*exp(-1i*W0*(0:n));
bb0 = conv(b0plus,a0minus) + conv(b0minus,a0plus);
aa0 = conv(a0plus,a0minus);
aa0 = real(aa0);

a1plus = a1.*exp(1i*W1*(0:n));
b1plus = b1.*exp(1i*W1*(0:n));
a1minus = a1.*exp(-1i*W1*(0:n));
b1minus = b1.*exp(-1i*W1*(0:n));
bb1 = conv(b1plus,a1minus) + conv(b1minus,a1plus);
aa1 = conv(a1plus,a1minus);
aa1 = real(aa1);

a2plus = a2.*exp(1i*W2*(0:n));
b2plus = b2.*exp(1i*W2*(0:n));
a2minus = a2.*exp(-1i*W2*(0:n));
b2minus = b2.*exp(-1i*W2*(0:n));
bb2 = conv(b2plus,a2minus) + conv(b2minus,a2plus);
aa2 = conv(a2plus,a2minus);
aa2 = real(aa2);

a3plus = a3.*exp(1i*W3*(0:n));
b3plus = b3.*exp(1i*W3*(0:n));
a3minus = a3.*exp(-1i*W3*(0:n));
b3minus = b3.*exp(-1i*W3*(0:n));
bb3 = conv(b3plus,a3minus) + conv(b3minus,a3plus);
aa3 = conv(a3plus,a3minus);
aa3 = real(aa3);

a4plus = a4.*exp(1i*W4*(0:n));
b4plus = b4.*exp(1i*W4*(0:n));
a4minus = a4.*exp(-1i*W4*(0:n));
b4minus = b4.*exp(-1i*W4*(0:n));
bb4 = conv(b4plus,a4minus) + conv(b4minus,a4plus);
aa4 = conv(a4plus,a4minus);
aa4 = real(aa4);

a5plus = a5.*exp(1i*W5*(0:n));
b5plus = b5.*exp(1i*W5*(0:n));
a5minus = a5.*exp(-1i*W5*(0:n));
b5minus = b5.*exp(-1i*W5*(0:n));
bb5 = conv(b5plus,a5minus) + conv(b5minus,a5plus);
aa5 = conv(a5plus,a5minus);
aa5 = real(aa5);

a6plus = a6.*exp(1i*W6*(0:n));
b6plus = b6.*exp(1i*W6*(0:n));
a6minus = a6.*exp(-1i*W6*(0:n));
b6minus = b6.*exp(-1i*W6*(0:n));
bb6 = conv(b6plus,a6minus) + conv(b6minus,a6plus);
aa6 = conv(a6plus,a6minus);
aa6 = real(aa6);

a7plus = a7.*exp(1i*W7*(0:n));
b7plus = b7.*exp(1i*W7*(0:n));
a7minus = a7.*exp(-1i*W7*(0:n));
b7minus = b7.*exp(-1i*W7*(0:n));
bb7 = conv(b7plus,a7minus) + conv(b7minus,a7plus);
aa7 = conv(a7plus,a7minus);
aa7 = real(aa7);


a8plus = a8.*exp(1i*W8*(0:n));
b8plus = b8.*exp(1i*W8*(0:n));
a8minus = a8.*exp(-1i*W8*(0:n));
b8minus = b8.*exp(-1i*W8*(0:n));
bb8 = conv(b8plus,a8minus) + conv(b8minus,a8plus);
aa8 = conv(a8plus,a8minus);
aa8 = real(aa8);

a9plus = a9.*exp(1i*W9*(0:n));
b9plus = b9.*exp(1i*W9*(0:n));
a9minus = a9.*exp(-1i*W9*(0:n));
b9minus = b9.*exp(-1i*W9*(0:n));
bb9 = conv(b9plus,a9minus) + conv(b9minus,a9plus);
aa9 = conv(a9plus,a9minus);
aa9 = real(aa9);

H_bpf0 = freqz(bb0,aa0,N,'whole');
H_bpf1 = freqz(bb1,aa1,N,'whole');
H_bpf2 = freqz(bb2,aa2,N,'whole');
H_bpf3 = freqz(bb3,aa3,N,'whole');
H_bpf4 = freqz(bb4,aa4,N,'whole');
H_bpf5 = freqz(bb5,aa5,N,'whole');
H_bpf6 = freqz(bb6,aa6,N,'whole');
H_bpf7 = freqz(bb7,aa7,N,'whole');
H_bpf8 = freqz(bb8,aa8,N,'whole');
H_bpf9 = freqz(bb9,aa9,N,'whole');

figure(9);
plot(FF,20*log10(abs(fftshift(H_bpf0))), ...
     FF,20*log10(abs(fftshift(H_bpf1))), ...
     FF,20*log10(abs(fftshift(H_bpf2))), ...
     FF,20*log10(abs(fftshift(H_bpf3))), ...
     FF,20*log10(abs(fftshift(H_bpf4))), ...
     FF,20*log10(abs(fftshift(H_bpf5))), ...
     FF,20*log10(abs(fftshift(H_bpf6))), ...
     FF,20*log10(abs(fftshift(H_bpf7))), ...
     FF,20*log10(abs(fftshift(H_bpf8))), ...
     FF,20*log10(abs(fftshift(H_bpf9))));

grid on;
axis([.19 0.39 -80 10]);
xlabel('frequency (cycles/sample)');
ylabel('magnitude (dB)');
title('Bank of 10 IIR Filters');

[b,a] = butter(n, Wc1/pi);

datum(1,1) = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5easy1.mat');
datum(1,2) = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5easy2.mat');
datum(1,3) = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5easy3.mat');
datum(1,4) = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5easy4.mat');
datum(1,5) = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5easy5.mat');
datum(1,6) = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5hard1.mat');
datum(1,7) = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5hard2.mat');
datum(1,8) = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5hard3.mat');
datum(1,9) = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5hard4.mat');
datum(1,10) = load('J:\groups\ecen380lab\Lab5\lab5hard5\lab5hard5.mat');

for dataSet = 1:10
    for R = 1:10
        W0(:,R) = 2*pi*(.2+(.02*(R-1)));
        aplus(:,R) = a.*exp(1i*W0(:,R)*(0:n));
        bplus(:,R) = b.*exp(1i*W0(:,R)*(0:n));
        aminus(:,R) = a.*exp(-1i*W0(:,R)*(0:n));
        bminus(:,R) = b.*exp(-1i*W0(:,R)*(0:n));
        bb(:,R) = conv(bplus(:,R),aminus(:,R)) + conv(bminus(:,R),aplus(:,R));
        aa(:,R) = conv(aplus(:,R),aminus(:,R));
        aa(:,R) = real(aa(:,R));

        filtered(:,R) = filter(bb(:,R), aa(:,R),datum(:,dataSet).x);
        filtered(:,R) = filtered(:,R).^2;
        result(R) = mean(filtered(:,R));
    end
    [val(:,dataSet), index(:,dataSet)] = max(result)
end

%%%%%%%%%%%%%%%%%%% End Task 2 %%%%%%%%%%%%%%%%%%%%%
