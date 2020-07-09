// Gmsh project created on Tue Jul  7 23:27:28 2020
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1};
//+
Point(2) = {0.05, 0, 0, 1};
//+
Point(3) = {0, 0.025, 0, 1};
//+
Point(4) = {0.05, 0.025, 0, 1};
//+
Line(1) = {1, 2};
//+
Line(2) = {2, 4};
//+
Line(3) = {4, 3};
//+
Line(4) = {3, 1};
//+
Curve Loop(1) = {3, 4, 1, 2};
//+
Plane Surface(1) = {1};

//+
Extrude {0, 0, 0.0025} {
  Surface{1}; Layers{1}; Recombine;
}
//+
Surface Loop(2) = {2, 5, 4, 3, 6, 1};
//+
Volume(2) = {2};
//+
Physical Surface("inlet") = {3}; 
//+
Physical Surface("outlet") = {5}; 
//+
Physical Surface("simetry") = {2, 4}; 
//+
Physical Surface("frontAndBack") = {6, 1};
//+
Physical Volume("fluid") = {1}; 
