/**
 * @namespace afw.sie_21.regn.barre_rechr_raprt_inter
 */
afw.sie_21.regn.barre_rechr_raprt_inter = {
  insta: [],
  /**
	 * @constructor
	 */
	barre_rechr_raprt_inter : function (pjs_optio, pjs_calbc){
		var that		                  = this;
    this.jQuery                   = afw.jQuery;
    this.node		                  = false;
		this.id			                  = false;
    this.raprt_inter_barre_outil  = false;
		this.initl		                = initl;
		
    this.optio = {
      vva_id_div_regn: ""
    };
    
    this.initl(pjs_optio);
    
		return that;
    
		function initl(pjs_optio) {
		  //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(that.optio, pjs_optio);
      
      // determine type of pjs_id and assign that.node accordingly
			try{
				switch(typeof(that.optio.vva_id_div_regn)){
					case 'string':
						that.node = document.getElementById(that.optio.vva_id_div_regn);
						break;
					case 'object':
						that.node = that.optio.vva_id_div_regn;
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
        
        //fusionner les options passées en paramètre et leurs valeurs par défaut
        that.optio = that.jQuery.extend(that.optio, pjs_optio);
        
        that.raprt_inter_barre_outil = that.jQuery("#"+that.optio.vva_id_div_regn).prevAll("#apexir_WORKSHEET_REGION").find("#apexir_TOOLBAR")
        
        that.jQuery("#"+that.optio.vva_id_div_regn).appendTo(that.raprt_inter_barre_outil);
        
        that.jQuery("#"+that.optio.vva_id_div_regn).css("display","inline");
        
      } //end if (that.node)
    }; //END initl  
    
		return that;
	}//END barre_rechr_raprt_inter
}