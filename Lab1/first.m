%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Luke Hsiao & Travis Chambers
% ECEn 380 | Lab 1
% 9 Sept 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lab 1 Procedure
2*1.5
x = 3*sqrt(2);
x
vec = [3, 2, 5.6]
vec3 = 3*vec
index1 = 1:100
index2 = 0:0.5:5
index3 = 0:2*pi/10:2*pi
length(index3)
index3'
index4 = index3'
array1 = [3, 2, 5.6, 7; 1, 4, 5, 9; 1, 2, 3, 4]
q1 = array1(3,2)
q2 = array1(1:3, 4)
q3 = array1(2:3, 2:4)
q4 = array1([1, 3], :)
array2 = array1
array2(2:3,2:3) = [0.5, 0.5; 0.7, 0.7]

% Own practice assignments
test1 = [1, 2, 3, 4, 5; 5, 4, 3, 2, 1; 1, 2, 3, 4, 5]
test2 = test1.^2
test3 = ones(2, 2)
test4 = test3 + 8
% End practice

z1 = sqrt(index2);
z2 = sqrt(array1);
z1

m1 = [1, 4, 3; 2, 3, 1; 5, 4, 3]
m2 = [1, 1, 1; 0, 0, 1; 0, 2, 0]
m1*m2
m1.*m2
m1^2
m1.^2

% Plotting
plot(index3)
plot(sin(index3))
plot(index3, sin(index3));
xlabel('input');
ylabel('output');
y1 = sin(index3);
y2 = cos(index3);
plot(index3, y1, '-', index3, y2, ':')
legend('sine', 'cosine')

newmatrix = [y1', y2']
bar(index3, newmatrix)
axs tight

xind = [0:0.2:20];
yind = [0:0.2:10];
[xx, yy] = meshgrid(xind,yind); %create matrices of x values and y
sinxy = sin(0.1*pi*xx - 0.2*pi*yy);
mesh(xind, yind, sinxy)

% Practice Plots
f1 = randi([10, 50], 1, 10);
f2 = randi([10, 50], 3, 10);
f3 = [f1;f2];
figure(1)
plot(f1)
figure(2)
bar3(f3)

%%%% Sound %%%%
t = [0:1/16000:10];
s1 = sin(2*pi*400*t);
sound(s1, 16000)
wavwrite(s1, 16000, 'sound1.wav')
wavwrite(s1, 48000, 'sound2.wav')
s2 = sin(2*pi*1200*t);
wavwrite(s2, 16000, 'sound3.wav')

%%%% Control Flow %%%%
f(1:2) = [0, 1];
for k = 3:10, % for (int k = 3; k < 10; k++)
    f(k) = f(k-1) + f(k-2);
end
disp(f)

t = [0:1/16000:1];
for m = 1:10,
    s2 = sin(2*pi*100*m*t);
    sound(s2, 16000)
    pause(3)
end

% Relational Operators
first = ((0:10) < 3)'
t = [0:1/16000:10];
s2 = s1.*(t > 3).*(t < 5);
figure(3)
plot(t, s2)
xlabel('time(s)');
ylabel('s2(t)');
axis tight
sound(s2, 16000);

z0 = zeros(5, 2)
o1 = ones(6)