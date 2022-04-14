syms theta4 theta5 theta6 d6 real
a=[0 0 0 ];
alpha=[-pi/2 pi/2 0 ];
d=[0 0  d6 ];
theta=[theta4 theta5 theta6 ];
A01 = link_matrix(a(1), alpha(1), d(1), theta(1))
A12 = link_matrix(a(2), alpha(2), d(2), theta(2))
A23 = link_matrix(a(3), alpha(3), d(3), theta(3))

T = A01*A12*A23
T = simplify(T)
