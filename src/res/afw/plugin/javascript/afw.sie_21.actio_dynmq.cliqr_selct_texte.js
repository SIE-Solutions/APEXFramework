/**
 * @namespace afw.sie_21.actio_dynmq.cliqr_selct_texte
 */
afw.sie_21.actio_dynmq.cliqr_selct_texte = {
  insta: [],
  /**
  * @constructor
  */
  cliqr_selct_texte : function (pjs_optio, pjs_calbc){
    var that                      = this;
    this.node                     = false;
    this.id                       = false;
    this.initl                    = initl;
    this.jQuery                   = afw.jQuery;
    
    this.optio = {
      vva_item_sourc: "",
      vjs_cible: []
    };
    
    this.initl(pjs_optio);
    
    return that;
    
    function initl(pjs_optio) {
      // fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(that.optio, pjs_optio);
      
      try{
        switch(typeof(that.optio.vva_item_sourc)){
          case 'string':
            that.node = document.getElementById(that.optio.vva_item_sourc);
            break;
          case 'object':
            that.node = that.optio.vva_item_sourc;
            break;
          default:
            that.node = false;
            break;
        }
      }
      catch(e){
        that.node = false;
      }
      
      // only proceed if that.node are not false
      if(that.node){
        that.id = that.node.id;
        
        //fusionner les options passées en paramètre et leurs valeurs par défaut
        that.optio = that.jQuery.extend(that.optio, pjs_optio);
        
        that.jQuery('#'+that.optio.vva_item_sourc).click(function(){selct_text_group(that.optio.vjs_cible)});
        
      } //end if (that.node)
    } //END initl  
    
    function selct_text_group(pjs_cible) {
      for (var i=0; i<pjs_cible.length; i++){
        selct_text(pjs_cible[i]);
      }
    } //END selct_text_group
    
    function selct_text(pNd) {
      var text = document.getElementById(pNd);
      if (that.jQuery.browser.msie) {
        var range = document.body.createTextRange();
        range.moveToElementText(text);
        range.select();
      }
      else if (that.jQuery.browser.mozilla || $.browser.opera) {
        var selection = window.getSelection();
        var range = document.createRange();
        range.selectNodeContents(text);
        selection.removeAllRanges();
        selection.addRange(range);
      }
      else if (that.jQuery.browser.safari) {
        var selection = window.getSelection();
        selection.setBaseAndExtent(text, 0, text, 1);
      }
    } //END selct_text
    
    return that;
  }//END cliqr_selct_texte
}



