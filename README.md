# Multiscale-FEM
This repo contains matlab code for multiscale finite element method.
We implemented the multiscale finite element method proposed in Xiaohui Wu's [paper](docs/MsFEM.pdf). 
Check our final [presentation](docs/presentation.pdf).
The implementation detail is in the short [paper](docs/report.pdf). 
This project got the highest score in the class of Math/CS 715 - Computational Mathematics II.

For traditional FEM, in order to capture the small scale information of periodic media with high frequency,
very fine grid should be used. The size of the problem could be very large which is computational prohibitive
![traditional](images/traditional.png). From the below figure,
we can see if 10 X 10 grid is used, the result can not capture the fluctuation
of solution. In order to capture the feature, 200 X 200 grid is used which is
every expensive and has large memory foot print.

Using multiscale FEM, we can get similar results with much coarser grid.
![result](images/result.png). From the below figure, we can see it took much
less computing resource to use multiscale FEM. 
