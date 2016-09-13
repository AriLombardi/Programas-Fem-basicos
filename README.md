# Programas-Fem-basicos
Contiene programas para un curso introductorio de Elementos Finitos usando Matlab y FreeFem++

fem1d: el archivo principal es fem1d.m. Resuelve una ecuación de Poisson en un intervalo (a,b) con coeficiente de difusión diffCoef, lado derecho f, usando elementos finitos de grado arbitrario. Las condiciones de borde pueden ser de Dirichlet o Neumann.

fem2d: el archivo principal es fem2d.m. Resuleve una ecuación de Laplace en un dominio usando la malla [p,e,t]. El lado derecho es frhs2d.m y el dato de Dirichlet u_D.m. Si se tiene la solución exacta, calcula los errores L2 y H1.

fem2d_ff: contiene programas para resolver la ecuación de Laplace en FreeFem++, estudiando la convergencia. fem2d_ff_convergencia.edp contiene un ejemplo con convergencia óptima, fem2d_ff_convergencia_suboptima.edp contiene un ejemplo con convergencia subópima, y 
fem2d_ff_import_mesh es un ejemplo que importa una malla.

Adaptividad: combina programas en Matlab y en FreeFem++ para generar un algoritmo Solve-Estimate-Mark-Refine. El código Matlab  programa.m usa códigos de FreeFem++ para resolver, estimar y marcar, y usa Matlab para generar la malla refinada. Calcula errores y orden de convergencia si se tiene la solución exacta.
