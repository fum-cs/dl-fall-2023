load optdeblur
[m,n] = size(P);
mn = m*n;
figure
imshow(P);
colormap(gray);
axis off image;
title([int2str(m) ' x ' int2str(n) ' (' int2str(mn) ') pixels'])

% Add Motion
% Simulate the effect of vertical motion blurring by averaging each pixel with the 5 pixels above and below. Construct a sparse matrix D to blur with a single matrix multiply.
blur = 5;
mindex = 1:mn;
nindex = 1:mn;
for i = 1:blur
  mindex=[mindex i+1:mn 1:mn-i];
  nindex=[nindex 1:mn-i i+1:mn];
end
D = sparse(mindex,nindex,1/(2*blur+1));

% Draw a picture of D.

cla
axis off ij
xs = 31;
ys = 15;
xlim([0,xs+1]);
ylim([0,ys+1]);
[ix,iy] = meshgrid(1:(xs-1),1:(ys-1));
l = abs(ix-iy) <= blur;
text(ix(l),iy(l),'x')
text(ix(~l),iy(~l),'0')
text(xs*ones(ys,1),1:ys,'...');
text(1:xs,ys*ones(xs,1),'...');
title('Blurring Operator D (x = 1/11)')

% Multiply the image P by the matrix D to create a blurred image G
G = D*(P(:));
figure
imshow(reshape(G,m,n));

% Deblurred Image
% To deblur, suppose that you know the blurring operator D. How well can you remove the blur and recover the original image P?
% The simplest approach is to solve a least squares problem for x:
% min(‖Dx−G‖^2) subject to 0≤x≤1.

x = optimvar('x',mn,'LowerBound',0,'UpperBound',1);
expr = D*x-G;
objec = expr'*expr;
blurprob = optimproblem('Objective',objec);
sol = solve(blurprob);

% Solving problem using quadprog.

% Minimum found that satisfies the constraints.

% Optimization completed because the objective function is non-decreasing in 
feasible directions, to within the value of the optimality tolerance,
and constraints are satisfied to within the value of the constraint tolerance.

xpic = reshape(sol.x,m,n);
figure
imshow(xpic)
title('Deblurred Image')