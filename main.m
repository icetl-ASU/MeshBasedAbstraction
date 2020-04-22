% Based on Paper:
%   "Mesh-Based Affine Abstraction of Nonlinear Systems with Tighter Bounds"
%   Kanishka Singh, Qiang Shen, Sze Zheng Yong
%   https://ieeexplore.ieee.org/abstract/document/8618714
%   https://arxiv.org/abs/1811.02482
%
% Example Matlab code (using YALMIP)
%
% 2D Dubins examples only (x*cos(y) and x.*sin(y))
%

clc; clear; close all

des_error = 0.2; % precision

bound = [-2 2;0 2*pi]; % entire domain [x_min x_max,; y_min y_max]
m = 10; % number of grids along one dimension per subdomain

%%  Different continuity assumptions based on Proposition 1
    %1 -> C0
    %2 -> Lipchitz
    %3 -> C1
    %4 -> C2
    
algo = 4; 

%% Different functions 
% Examples for x*cos(y) and x.*sin(y)

example = 1;

switch example
    case 1
        func = @(x,y) x.*cos(y);
    case 2
        func = @(x,y) x.*sin(y);
end
    
%% Constants for Proposition 1 (can be easily substituted with other algorithms)
syms x y;  

deriv{1,1}=matlabFunction(diff(func,x),'Vars',[x y]);
deriv{1,2}=matlabFunction(diff(func,y),'Vars',[x y]);

hess{1,1} = matlabFunction(diff(deriv{1,1},x),'Vars',[x y]);
hess{1,2} = matlabFunction(diff(deriv{1,1},y),'Vars',[x y]);
hess{2,1} = matlabFunction(diff(deriv{1,2},x),'Vars',[x y]);
hess{2,2} = matlabFunction(diff(deriv{1,2},y),'Vars',[x y]);

lambda = value(lipchitz(deriv,bound));
lambda4 = case4(deriv,bound);
lambda5 = case5(hess,bound);

%% Main Code
tic

param = cell(7,1);
param{1} = des_error;
param{2} = lambda;
param{3} = func;
param{4} = m;
param{5} = algo;
param{6} = lambda4;
param{7} = lambda5;

final = recursive_error(bound,param);

toc

%% 
num_grids = size(final,1);
figure_number = example;
plot_all(final,func,figure_number);

display(num_grids) % Number of subregions

