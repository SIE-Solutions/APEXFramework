afw.sie_21.item.champ_rechr = {
  insta : [],
  obten : function(pnu_id) {
    for( i = 0; i < afw.sie_21.item.champ_rechr.insta.length; i++) {
      if(afw.sie_21.item.champ_rechr.insta[i].id == pnu_id) {
        return afw.sie_21.item.champ_rechr.insta[i];
      }
    }
  },
  suprm : function(pnu_id) {
    for( i = 0; i < afw.sie_21.item.champ_rechr.insta.length; i++) {
      if(afw.sie_21.item.champ_rechr.insta[i].id == pnu_id) {
        afw.sie_21.item.champ_rechr.insta.splice(i, 1);
      }
    }
  },
  /**
   * @constructor
   */
  champ_rechr : function(pjs_optio, pjs_calbc) {
    this.jQuery = afw.jQuery;
    var that = this;
    this.id = false;
    this.initl = initl;
    this._redrc = _redrc;

    this.optio = {
      vva_id_item : "",
      vva_plugn_ajax : ""
    };

    this.initl(pjs_optio);

    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

      that.id = that.optio.vva_id_item;

      $("#" + that.id).bind('keypress', function(e) {
        
        var vnu_code = (e.keyCode ? e.keyCode : e.which);
        if(vnu_code == 13 && this.value != "") {//Enter keycode

          if(e.stopPropagation) {
            e.stopPropagation();
          }
          if(e.cancelBubble != null) {
            e.cancelBubble = true;
          }
          e.preventDefault();

          that.jQuery.exec_aplic_procs({
            async : that.optio.vbo_async,
            procs_retrn_data_type : "text",
            plugn_ajax : that.optio.vva_plugn_ajax,
            widget_action : "EXECT_RECHR",
            x01: this.value,
            sucs_procs : that._redrc
          });

        }
      });
    }; //END initl

    function _redrc(pva_url) {
      console.log(pva_url);
      location.href = pva_url;
    }; //END _redrc

    return that;
  } //END champ_rechr
};
