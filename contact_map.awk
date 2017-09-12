#!/bin/awk -f

BEGIN {
	natom=0 
	num_cont=0
	count = 0
	numresidues = 55		

       for (k = 1; k <= numresidues; ++k) {
                for (m = 1; m <= numresidues; ++m) {
                        g[k,m] = 0
                }
        }


} 

{

	if($1 == "ATOM" ) {

                        RES[NR] = $5
			x[NR] = $6
			y[NR] = $7
			z[NR] = $8
			q[NR] = $9
			r[NR] = $10
			natom++
	}

}

END { 
	for(i = 1; i <= natom; i++){
		for(j = i+1; j <= natom; j++){
	          xx = (x[i] - x[j])*(x[i] - x[j])
		  yy = (y[i] - y[j])*(y[i] - y[j])
		  zz = (z[i] - z[j])*(z[i] - z[j])
		  Dij = sqrt(xx + yy + zz) - r[i] - r[j]
		  if ( Dij < 2.8 && (RES[i] - RES[j])*(RES[i] - RES[j]) > 1) { 
		     g[ RES[i], RES[j] ]++
		     if (g[RES[i], RES[j]] == 1) { 
		        print  RES[i] "   " RES[j] "  " Dij 
		     }
		  }
		


		}
	}
	
	  
}

