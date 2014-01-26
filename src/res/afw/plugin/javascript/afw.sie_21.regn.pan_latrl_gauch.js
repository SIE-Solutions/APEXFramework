/**
 * @namespace afw.sie_21.regn.pan_latrl_gauch
 */
afw.sie_21.regn.pan_latrl_gauch = {
  insta: [],
  /**
  * @constructor
  */
  pan_latrl_gauch: function (pjs_optio){
    var that                        = this;
    this.jQuery                     = afw.jQuery;
    this.node                       = false;
    this.id                         = false;
    this.initl                      = initl;
    
    this.optio = {
      vva_selct_zone_latrl_gauch: that.jQuery(".zone_corps .zone_latrl.gauch"),
      vva_stat: "ouver",
      vva_chemn_image_poign_fermr: "/res/afw/images/poign_fermr.png",
      vva_titre_image_poign_fermr: "Cacher le panneau",
      vva_chemn_image_poign_ouvri: "/res/afw/images/poign_ouvri.png",
      vva_titre_image_poign_ouvri: "Afficher le panneau"
    };
    
    this.initl(pjs_optio);
    
    return that;
    
    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(that.optio, pjs_optio);
      
      try{
        switch(typeof(that.optio.vva_selct_zone_latrl_gauch)){
          case 'string':
            that.node = document.getElementById(that.optio.vva_selct_zone_latrl_gauch);
            break;
          case 'object':
            that.node = that.optio.vva_selct_zone_latrl_gauch;
            break;
          default:
            that.node = false;
            break;
        }
      }catch(e){
        that.node = false;
      }
      
      // only proceed if that.node are not false
      if(that.node){
        that.id = that.node.id;
        
        if ((afw.sie_13.page.obten_numr_apex() == 1 && afw.sie_07.temn.obten("afw.sie_21.regn.pan_latrl_gauch")=="") || afw.sie_07.temn.obten("afw.sie_21.regn.pan_latrl_gauch")=="ouvri") {
          genr_pan_ouver();
        }
        else {
          genr_pan_fermr();
        }
        
      } //end if (that.node)
    }; //END initl
    
    function defnr_hautr_poign() {
      that.jQuery(".poign_ouvri_fermr").height(that.jQuery(".ui-sem.zone_corps .ui-sem.zone_centrl").height());
    }; //END defnr_hautr_poign
    
    function cachr() {
      afw.sie_07.temn.defnr("afw.sie_21.regn.pan_latrl_gauch","fermr",3600);
      
      that.jQuery(".poign_ouvri_fermr")
        .prev().hide();
      
      that.jQuery(".ui-sem.zone_corps .ui-sem.zone_centrl")
        .removeClass("pan_latrl_gauch_ouvri")
        .addClass("pan_latrl_gauch_fermr");
      
      that.jQuery("#poign_ouvri_fermr")
        .removeClass("poign_fermr")
        .addClass("poign_ouvri")
        .attr("src",that.optio.vva_chemn_image_poign_ouvri)
        .attr("title",that.optio.vva_titre_image_poign_ouvri)
        .parent("div").addClass("poign_ouvri").removeClass("poign_fermr");
    }; //END cachr
    
    function afich() {
      afw.sie_07.temn.defnr("afw.sie_21.regn.pan_latrl_gauch","ouvri",3600);
      
      that.jQuery(".poign_ouvri_fermr")
        .prev().show();
      
      that.jQuery(".ui-sem.zone_corps .ui-sem.zone_centrl")
        .removeClass("pan_latrl_gauch_fermr")
        .addClass("pan_latrl_gauch_ouvri");
      
      that.jQuery("#poign_ouvri_fermr")
        .removeClass("poign_ouvri")
        .addClass("poign_fermr")
        .attr("src",that.optio.vva_chemn_image_poign_fermr)
        .attr("title",that.optio.vva_titre_image_poign_fermr)
        .parent("div").addClass("poign_fermr").removeClass("poign_ouvri");
    }; //END afich
    
    function genr_pan_ouver() {
      that.jQuery(that.node)
        .append('<div class="poign_ouvri_fermr">'+
                '<img id="poign_ouvri_fermr" class="poign_fermr" src="'+
                that.optio.vva_chemn_image_poign_fermr+
                '" title="'+
                that.optio.vva_titre_image_poign_fermr+
                '" alt="" >'+
                '</div>');
      defnr_hautr_poign();
      afect_actio_poign();
      afich();
    }; //END genr_pan_ouver
    
    function genr_pan_fermr() {
      that.jQuery(that.node)
        .append('<div class="poign_ouvri_fermr">'+
                '<img id="poign_ouvri_fermr" class="poign_ouvri" src="'+
                that.optio.vva_chemn_image_poign_ouvri+
                '" title="'+
                that.optio.vva_titre_image_poign_ouvri+
                '" alt="" >'+
                '</div>');
      defnr_hautr_poign();
      afect_actio_poign();
      cachr();
    }; //END genr_pan_fermr
    
    function afect_actio_poign() {
      that.jQuery("#poign_ouvri_fermr")
        .click(function(){
          if (that.jQuery("#poign_ouvri_fermr").hasClass('poign_fermr')) {
            cachr();
          }
          else {
            afich();
          }
        });
    }; //END afect_actio_poign
    
    return that;
  } //END calnd
}