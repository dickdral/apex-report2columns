// APEX Report to Columns
// Author: Dick Dral
// Version: 1.0

// global namespace
var apexreport2columns = {
    // parse string to boolean
    parseBoolean: function(pString) {
        var pBoolean;
        if (pString.toLowerCase() == 'true') {
            pBoolean = true;
        }
        if (pString.toLowerCase() == 'false') {
            pBoolean = false;
        }
        if (!(pString.toLowerCase() == 'true') && !(pString.toLowerCase() == 'false')) {
            pBoolean = undefined;
        }
        return pBoolean;
    },

    // helper function to get right text
    getText: function(pSource, pText, pItem, pElement) {
        var vText;
        if (pSource == 'TEXT') {
            vText = pText;
        } else if (pSource == 'ITEM') {
            vText = $v(pItem);
        } else if (pSource == 'TITLE') {
            vText = $(pElement).attr('title');
        }
        return vText;
    },
    
    // function doing the real work
    distribute: function( tabSelector, numCols, direction )  {
      var numRows  = 0;  
	  var curtable = null;
	
	  // check parameter direction and apply default value
	  direction    = ( direction ) ? direction : 'vertical';
	
	  // calculate the number of rows per column
	  var table      = $(tabSelector).addClass('reportColumn'); 
	  var rowsPerCol = Math.ceil( ( $(table).find(' tr').length-1 )/numCols);
	  var randomNum  = Math.floor((Math.random() * 10000000) + 1);
	  var baseName   = 'reportColumn_'+randomNum;   
  
	  // create table template for columns 
	  var template = $(table).clone();
	  $(template).find('tr').has('td').remove();
  

	  if ( direction.toLowerCase() != 'horizontal') 
	  {  
		 // VERTICAL 
		 for ( i = 2; i <= numCols; i++)  
		 {  curtable = $(template).clone().attr('id',baseName+i).appendTo( $(table).parent() );
			rows = $(table).find('tr').has('td').slice( rowsPerCol, 2*rowsPerCol).detach();
			$(curtable).find('tbody').append(rows);
		 }  
	  }
	  else
	  {
		 // HORIZONTAL
		 // create columns
		 for ( i = 2; i <= numCols; i++)    
		 {  curtable = $(template).clone().attr('id',baseName+i).appendTo( $(table).parent() );  
		 }  
 
		 // distribute the rows over the columns
		 var id = 1;  
		 $(tabSelector).find('tbody tr').each( function(index)  
		 { 
			// move cell if not in first column  
			if ( id > 1  ) { $('#'+baseName+id+' tbody').append( $(this) );  }

			// restart with column 1 when behind last column
			id = ( id < numCols ) ? id + 1 : 1;
		 } );   
	  }    

    },
    
    // function that gets called from plugin
    doIt: function() {
        // plugin attributes
        var daThis = this;
        var vElementsArray = daThis.affectedElements;
        var vTabSelector   = '#'+$(vElementsArray[0]).attr('id')+' table.t-Report-report';
        var vNumcols = daThis.action.attribute01;
        var vDirection = daThis.action.attribute02;
        // Logging
        var vLogging = true;
        if (vLogging) {
            console.log('showTooltip: affectedElement:', vTabSelector);
            console.log('showTooltip: Attribute Number of columns:', vNumcols);
            console.log('showTooltip: Attribute Direction:', vDirection);
        }
        apexreport2columns.distribute(vTabSelector,vNumcols,vDirection);
    }
};
