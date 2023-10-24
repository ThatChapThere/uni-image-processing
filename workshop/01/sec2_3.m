sin(pi/2)
cos(pi/2)
rem(12,4)
rem(12,5)

x = [0:0.1:1]
y = exp(x)

A = [9,7,0;0,8,6;7,1,-6]

size(A)
det(A)
inv(A)
A*inv(A) - eye(3)

eig(A)
[X, D] = eig(A)