****************************************************************************
*
*	Copyright (C) 1984-2002 Micro Focus International Ltd. 
*	All rights reserved.
*
****************************************************************************/
       01 (prefix)-details.
        03 (prefix)-text-details.
	    05 (prefix)-title  pic x(50).
	    05 (prefix)-type   pic x(20).
	    05 (prefix)-author pic x(50).
        03     (prefix)-stockno   	pic x(4).
        03 (prefix)-retail	pic 99v99.
	    03 (prefix)-onhand	pic 9(5).
	    03 (prefix)-sold	pic 9(5)    comp-3.
