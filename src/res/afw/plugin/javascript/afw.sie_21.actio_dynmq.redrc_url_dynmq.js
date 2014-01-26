/**
 * @namespace afw.sie_21.actio_dynmq.redrc_url_dynmq
 */
afw.sie_21.actio_dynmq.redrc_url_dynmq = {
  insta : [],
  obten : function(pnu_id) {
    for( i = 0; i < afw.sie_21.actio_dynmq.redrc_url_dynmq.insta.length; i++) {
      if(afw.sie_21.actio_dynmq.redrc_url_dynmq.insta[i].id == pnu_id) {
        return afw.sie_21.actio_dynmq.redrc_url_dynmq.insta[i];
      }
    }
  },
  suprm : function(pnu_id) {
    for( i = 0; i < afw.sie_21.actio_dynmq.redrc_url_dynmq.insta.length; i++) {
      if(afw.sie_21.actio_dynmq.redrc_url_dynmq.insta[i].id == pnu_id) {
        afw.sie_21.actio_dynmq.redrc_url_dynmq.insta.splice(i, 1);
      }
    }
  },
  /**
   * @constructor
   */
  redrc_url_dynmq : function(pjs_optio, pjs_calbc) {
    this.jQuery = afw.jQuery;
    var that = this;
    this.id = false;
    this.initl = initl;
    
    this.redrc_url_dynmq = redrc_url_dynmq;
	this._redrg = _redrg;
	this._defnr_url = _defnr_url;

    this.optio = {
	  vva_plugn_ajax : "",
      vnu_id_actio_dynmq : "",
      vva_html_id_actio_dynmq : "",
      vva_nom_plugn : "",
      vva_fonct_url : "",
	  vva_url : ""
    };

    this.initl(pjs_optio);

    return that;

    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(that.optio, pjs_optio);

      that.id = that.optio.vva_html_id_actio_dynmq;
	  
	  that.redrc_url_dynmq();
    }; //END initl
	
	function _defnr_url(pva_url) {
	    console.log(pva_url);
		that.optio.vva_url = pva_url;
	};
	
	function _redrg() {
	    console.log(that.optio.vva_url);
		location.href = that.optio.vva_url;
	}; //END _redrg

    function redrc_url_dynmq() {
	  that.jQuery.exec_aplic_procs({                
	    "plugn_ajax" :     that.optio.vva_plugn_ajax,
		"widget_action" : "OBTEN_URL",
		"x01": that.optio.vva_fonct_url,
		"sucs_procs" : function(pjs_json) {
			that._defnr_url(pjs_json.url);
			that._redrg();
		}
	  });
    }; //END _redrc_url_dynmq
	
    return that;
  } //END redrc_url_dynmq
}