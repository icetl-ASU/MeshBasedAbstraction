# Mesh-based affine abstraction of nonlinear systems with tighter bounds

This is the code of Mesh-based affine abstraction of nonlinear systems with tighter bounds. Please refer to the reference: 

Singh, Kanishka Raj, Qiang Shen, and Sze Zheng Yong. "Mesh-based affine abstraction of nonlinear systems with tighter bounds." 2018 IEEE Conference on Decision and Control (CDC). IEEE, 2018.

## List of capabilities: 
- Solve a linear program (LP) recursively to obtain desired abstration of nonlinear systems in whole domain
- Compare with previous work 
  - Alimguzhin, Vadim, et al. "Linearizing discrete-time hybrid systems." IEEE Transactions on Automatic Control 62.10 (2017): 5357-5364.

## Requirements

 - Matlab 2018b
 - Optimizaiton modeling toolbox, Yalmip (https://yalmip.github.io/download/)
 - Solver: Gurobi 7.5.2 for solving LP and supporting SOS-1 constraint (https://www.gurobi.com/)
