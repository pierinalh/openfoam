// Gmsh project created on Wed Jul  8 17:50:02 2020
SetFactory("OpenCASCADE");
//+
Ellipse(1) = {0, 0.0125, 0, 0.02, 0.0125, 0, 0.5*Pi};

//+
Ellipse(2) = {0, -0.0125, 0, 0.020, 0.0125, 1.5*Pi, 2*Pi};
//+
Point(5) = {0.05, 0.0125, 0, 1.0};
//+
Point(6) = {0.05, -0.0125, 0, 1.0};
//+
Line(3) = {1, 5};
//+
Line(4) = {5, 6};
//+
Line(5) = {4, 6};
//+
Line(6) = {2, 3};
//+
Curve Loop(1) = {1, 6, 2, 5, -4, -3};
//+
Plane Surface(1) = {1};
//+
Extrude {0, 0, 0.0025} {
  Surface{1}; Layers{1}; Recombine;
}
//+
Surface Loop(2) = {7, 2, 8, 3, 4, 5, 6, 1};
//+
Volume(2) = {2};
//+
Physical Surface("inlet") = {6};
//+
Physical Surface("outlet") = {3};
//+
Physical Surface("frontAndBack") = {8, 1};
//+
Physical Surface("simetry") = {2, 7, 4, 5};
//+
Physical Volume("fluid") = {1};
