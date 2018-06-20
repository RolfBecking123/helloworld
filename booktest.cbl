      $set intlevel(4)
       working-storage section.
       01 ws-function     pic x.
           88 read-record    value "1".
           88 add-record     value "2".
           88 delete-record  value "3".
           88 next-record    value "4".
       01 ws-file-status  pic xx.
       copy "book-rec.cpy" replacing ==(prefix)== by ==ws-b==.

       screen section.
       01 user-input-screen.
           03 line 3 column 5  value "Function:  [".
	   03 line 3 column 17 pic x using ws-function.
	   03 line 3 column 18 value "] Read=1, Add=2, Delete=3" &
	                                  " Next=4, Quit=9".
           
           03 line 5 column 5 value "Stock Number:    [".
           03 line 5 column 23 pic x(4) using ws-b-stockno.
           03 line 5 column 27 value "]".

           03 line 7 column 5  value "Title:   [".
           03 line 7 column 15 pic x(50) using ws-b-title.
           03 line 7 column 65  value "]".

           03 line 9 column 5  value "Type:    [".
           03 line 9 column 15 pic x(20) using ws-b-type.
           03 line 9 column 35  value "]".

	   03 line 11 column 5  value "Author:  [".
           03 line 11 column 15 pic x(50) using ws-b-author.
           03 line 11 column 65  value "]".
           
           03 line 13 column 5 value "Retail:  [".
	   03 line 13 column 15 pic 99.99 using ws-b-retail.
           03 line 13 column 20  value "]".
           
           03 line 13 column 30 value "On hand: [".
	   03 line 13 column 40 pic z(4)9 using ws-b-onhand.
           03 line 13 column 45  value "]".
           
           03 line 13 column 56 value "Sold: [".
	   03 line 13 column 63 pic z(4)9 using ws-b-sold.
           03 line 13 column 68  value "]".
                      
           03 line 15 column 5 value "--------------".
           
           03 line 16 column 5 value "Status:  [".
           03 line 16 column 15 pic xx from ws-file-status.
           03 line 16 column 18  value "]".

       procedure division.
           initialize ws-b-details
           perform until ws-function = "9"
               display user-input-screen
               accept user-input-screen
               call "book" using ws-function
                                 ws-b-details
                                 ws-file-status

           end-perform
           stop run
           .
