/**
 * @namespace afw.sie_21.item.popup_lov_raprt_inter
 */
afw.sie_21.item.popup_lov_raprt_inter = {
  insta: [],
  /**
	 * @constructor
	 */
	popup_lov_raprt_inter : function (pjs_optio){
		var that		                = this;
    this.jQuery                 = afw.jQuery;
    this.node		                = false;
		this.id			                = false;
    this.initl		              = initl;
    
    this.optio = {
      vva_id_item: ""
    };
    
    this.initl(pjs_optio);
    
		return that;
    
		function initl(pjs_optio) {
		  //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(that.optio, pjs_optio);
      
      // determine type of pjs_id and assign that.node accordingly
			try{
				switch(typeof(that.optio.vva_id_item)){
					case 'string':
						that.node = document.getElementById(that.optio.vva_id_item);
						break;
					case 'object':
						that.node = that.optio.vva_id_item;
						break;
					default:
						that.node = false;
						break;
				}
			}catch(e){
				that.node = false;
			}
      
      // only proceed if that.regn_node and that.node are not false
			if(that.node){
				that.id = that.node.id;
        
      } //end if (that.node)
    }; //END initl
    
		return that;
	}//END popup_lov_raprt_inter
}