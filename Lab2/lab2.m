close all
clear all

t = linspace(-1e-3, 10e-3, 1000)    %X-Axis time for all plots

%Set L and C to meet our midrange frequency
L = 4e-3 
C = 3.3e-6

scale = (25e-6 * 20.9)  %Scale factor after measuring pulse in O-Scope

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 8 Ohm Response
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rl = 8
Rg = 82
Rs = 50
P1 = -1/(2*Rl*C) + sqrt((1/(2*Rl*C))^2 - 1/(L*C))
P2 = -1/(2*Rl*C) - sqrt((1/(2*Rl*C))^2 - 1/(L*C))

h1 = 1/(P1 - P2)*(1/(C*(Rs+Rg))*(P1*exp(P1*t)-P2*exp(P2*t))).*(t > 0)
h1_temp = h1
h1 = h1*scale
figure(1)
plot(t, h1, 'r')
xlabel('Time (milliseconds)')
ylabel('Voltage (volts)')
title('Impulse Response at 8 Ohms')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 33 Ohm Response
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rl = 32.4
Rg = 324
P1 = -1/(2*Rl*C) + sqrt((1/(2*Rl*C))^2 - 1/(L*C))
P2 = -1/(2*Rl*C) - sqrt((1/(2*Rl*C))^2 - 1/(L*C))
h2 = 1/(P1 - P2)*(1/(C*(Rs+Rg))*(P1*exp(P1*t)-P2*exp(P2*t))).*(t > 0)
h2 = h2*scale
figure(2)
plot(t, h2, 'r')
xlabel('Time (milliseconds)')
ylabel('Voltage (volts)')
title('Impulse Response at 33 Ohms')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 100 Ohm Response
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rl = 118.6
Rg = 1180
P1 = -1/(2*Rl*C) + sqrt((1/(2*Rl*C))^2 - 1/(L*C))
P2 = -1/(2*Rl*C) - sqrt((1/(2*Rl*C))^2 - 1/(L*C))
h3 = 1/(P1 - P2)*(1/(C*(Rs+Rg))*(P1*exp(P1*t)-P2*exp(P2*t))).*(t > 0)
h3=h3*scale
figure(3)
plot(t, h3, 'r')
xlabel('Time (milliseconds)')
ylabel('Voltage (volts)')
title('Impulse Response at 100 Ohms')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Task 3: Plot of Calculations for to = 1ms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rl = 8
Rg = 82
P1 = -1/(2*Rl*C) + sqrt((1/(2*Rl*C))^2 - 1/(L*C))
P2 = -1/(2*Rl*C) - sqrt((1/(2*Rl*C))^2 - 1/(L*C))
x = 1/(P1 - P2) * (1/(C*(Rs+Rg)))
y = (-exp(P1*(t-.001)) + exp(P2*(t-.001))).*(t > .001)
z = (exp(P1 * t) - exp(P2 * t)).*(t > 0)
Vl = x * (y + z)
figure(4)
plot(t, Vl, 'r')
xlabel('Time (milliseconds)')
ylabel('Voltage (volts)')
title('Task 3 Response at 8 Ohms')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Task 3: Plot of MATLAB's 'conv' function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rl = 8
Rg = 82
scale = (1e-3 * 1)  % measured from our 1V, 1ms input pulse
P1 = -1/(2*Rl*C) + sqrt((1/(2*Rl*C))^2 - 1/(L*C))
P2 = -1/(2*Rl*C) - sqrt((1/(2*Rl*C))^2 - 1/(L*C))
h1_temp = 1/(P1 - P2)*(1/(C*(Rs+Rg))*(P1*exp(P1*t)-P2*exp(P2*t))).*(t > 0)
h1_temp = h1_temp * scale
Vl_2 = conv(rectangularPulse(0, .001, t), h1_temp)
figure(5)
t = linspace(-1e-3, 10e-3, 1999) %needs to be twice as long to match output
plot(t, Vl_2, 'r')
xlabel('Time (milliseconds)')
ylabel('Voltage (volts)')
title('Approximate Convolution')