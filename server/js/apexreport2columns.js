// APEX Resize Dialog
// Author: Dick Dral (Detora)
// Version: 1.0

// global namespace
var apexresizedialog = {

resize_dialog: function ( center_dialog, dialog_margin )
{
  console.log('perform dialog resize');
  
  var header  = $('.t-Dialog-header');
  var height  = parseInt($(header).height());  
    
  var body    = $('.t-Dialog-body');
  var padding = parseInt($(body).css('padding-top')) + parseInt($(body).css('padding-bottom'));
  height += padding;
    
  var container = $(body).find('.container').first();
  height   += parseInt($(container).height());  
    
  var footer    = $('.t-Dialog-footer');
  height   += parseInt($(footer).height());  

  var dialog_window    = window.parent.$('.ui-dialog');
  var dialog_titlebar  = window.parent.$('.ui-dialog-titlebar');
  var dialog_container = window.parent.$('.ui-dialog-content');

  var parent_height    = window.parent.innerHeight;
  var titlebar_height  = parseInt(dialog_titlebar.css('height'));
  var dialog_top       = parseInt(dialog_window.css('top'));

  center_dialog = ( center_dialog == true || center_dialog == false ) ? center_dialog : false;
  dialog_margin = ( dialog_margin == undefined || dialog_margin == null ) ? 20 : parseInt(dialog_margin);
  console.log(center_dialog,dialog_margin,height);
  
  if ( center_dialog )
      {
          // how much height is available?
          var available_height = parent_height - titlebar_height - 2* dialog_margin;

          // adjust height if necessary
          height  = ( height < available_height ) ? height : available_height;

          // determine and set position
          var top = ( parent_height - height - titlebar_height ) / 2;
          dialog_window.css('top',top);

      }
  else
      {          
          // how much height is available?
          var available_height = parent_height - dialog_top - titlebar_height - dialog_margin;
console.log('parent_height - dialog_top - titlebar_height=',parent_height,dialog_top,titlebar_height);
          // adjust height if necessary
          height = ( height <= available_height ) ? height : available_height;
      }

	  console.log(height,dialog_container);
    
  $(dialog_container).height(height);
},

    // function that gets called from plugin
    doIt: function() {
        // plugin attributes
        var daThis = this;
		console.log('daThis.action.attribute01=',daThis.action.attribute01, typeof daThis.action.attribute01);
        var center_dialog = ( daThis.action.attribute01 == "true" ) ? true : false;
		var margin = daThis.action.attribute02;
        // Logging
        var vLogging = true;
        if (vLogging) {
            console.log('Resize Dialog: center_dialog=', center_dialog);
            console.log('Resize Dialog: margin=', margin);
        }
        apexresizedialog.resize_dialog(center_dialog,margin);
    }
};
