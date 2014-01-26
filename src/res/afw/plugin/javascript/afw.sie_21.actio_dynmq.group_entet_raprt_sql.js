/**
 * @namespace afw.sie_21.actio_dynmq.group_entet_raprt_sql
 */
afw.sie_21.actio_dynmq.group_entet_raprt_sql = {
  insta: [],
  obten : function(pva_id_regn) {
    var vjs_insta;
    
    for (i=0; i<afw.sie_21.actio_dynmq.group_entet_raprt_sql.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.group_entet_raprt_sql.insta[i].optio.vva_id_regn == pva_id_regn) {
        vjs_insta = afw.sie_21.actio_dynmq.group_entet_raprt_sql.insta[i];
        break;
      }
    }
    
    return vjs_insta;
  },
  suprm : function(pva_id_regn) {
    for (i=0; i<afw.sie_21.actio_dynmq.group_entet_raprt_sql.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.group_entet_raprt_sql.insta[i].optio.vva_id_regn == pva_id_regn) {
        afw.sie_21.actio_dynmq.group_entet_raprt_sql.insta.splice(i,1);
      }
    }
  },
  /**
  * @constructor
  */
  group_entet_raprt_sql : function(pjs_optio, pjs_calbc) {
    var that                        = this;
    this.node                       = false;
    this.id                         = false;
    this.table                      = false;
    this.jQuery                     = afw.jQuery;
    this.initl                      = initl;
    this.trans_raprt_sql            = trans_raprt_sql;
    
    this.optio = {
      vva_id_regn_reprt_catch:  "",
      vva_id_regn_reprt:        "",
      vva_id_regn:              "",
      var_ligne_1:              [],
      var_ligne_2:              [],
      var_ligne_3:              [],
	  vva_clas_css_surlg:		"",
	  vva_selct_surlg:			"",
      vjs_ajax: {
        vva_async:        false,
        vva_type_reqst:   "POST",
        vva_reqst_url:    "wwv_flow.show",
        vva_flow_id:      afw.sie_11.prodt.obten_numr_apex(),
        vva_flow_step_id: afw.sie_13.page.obten_numr_apex(),
        vva_insta:        afw.sie_07.sesn.obten_numr_apex(),
        vva_plugn_ajax:   ""
      }
    };
    
    this.initl(pjs_optio, pjs_calbc);
    
    return that;
    
    function initl(pjs_optio, pjs_calbc) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(that.optio, pjs_optio);
	  
      if (that.jQuery("#"+that.optio.vva_id_regn_reprt_catch+" table:eq(1)").length > 0) {
        that.node = document.getElementById(that.optio.vva_id_regn_reprt_catch);
        that.table = that.jQuery("#"+that.optio.vva_id_regn_reprt_catch+" table:eq(1)");
      }
      else {
        that.node = document.getElementById(that.optio.vva_id_regn_reprt);
        //that.table = that.jQuery("#"+that.optio.vva_id_regn_reprt+" table:eq(0)");
		
        that.table = that.jQuery("#"+that.optio.vva_id_regn_reprt);
      }
      
      if(that.node){
        that.id = that.node.id;
        that.trans_raprt_sql(pjs_calbc);          
      }
    }; //END initl
    
    function trans_raprt_sql(pjs_calbc) {
      if (that.table.length > 0) {
        // Cacher la région le temps de faire sa transformation
        that.jQuery(that.table).hide();
        
        for (i=0, nombr_range_i=that.optio.var_ligne_3.length; i<nombr_range_i; i++) {
          if (i == 0) {
            // Ajouter une rangée
            that.jQuery("tr:first",that.table).before('<tr></tr>');
          }
          
          // Ajouter les colonnes
          that.jQuery("tr:first",that.table).append('<th></th>');
          that.jQuery("tr:first th:eq("+i+")",that.table)
            .addClass("group_entet")
            .addClass("entet")
            .attr('colspan',that.optio.var_ligne_3[i].colsp)
            .attr('rowspan',that.optio.var_ligne_3[i].rowsp)
            .css('text-align','center')
            .html((that.optio.var_ligne_3[i].libl!="") ? that.optio.var_ligne_3[i].libl : "&nbsp;");
        }
        
        for (i=0, nombr_range_i=that.optio.var_ligne_2.length; i<nombr_range_i; i++) {
          if (i == 0) {
            // Ajouter une rangée
            that.jQuery("tr:first",that.table).before('<tr></tr>');
          }
          
          // Ajouter les colonnes
          that.jQuery("tr:first",that.table).append('<th></th>');
          that.jQuery("tr:first th:eq("+i+")",that.table)
            .addClass("group_entet")
            .addClass("entet")
            .attr('colspan',that.optio.var_ligne_2[i].colsp)
            .attr('rowspan',that.optio.var_ligne_2[i].rowsp)
            .css('text-align','center')
            .html((that.optio.var_ligne_2[i].libl!="") ? that.optio.var_ligne_2[i].libl : "&nbsp;");
        }
        
        for (i=0, nombr_range_i=that.optio.var_ligne_1.length; i<nombr_range_i; i++) {
          if (i == 0) {
            // Ajouter une rangée
            that.jQuery("tr:first",that.table).before('<tr></tr>');
          }
          
          // Ajouter les colonnes
          that.jQuery("tr:first",that.table).append('<th></th>');
          that.jQuery("tr:first th:eq("+i+")",that.table)
            .addClass("group_entet")
            .addClass("entet")
            .attr('colspan',that.optio.var_ligne_1[i].colsp)
            .attr('rowspan',that.optio.var_ligne_1[i].rowsp)
            .css('text-align','center')
            .html((that.optio.var_ligne_1[i].libl!="") ? that.optio.var_ligne_1[i].libl : "&nbsp;");
        }
        
	  //Surligner à partir du selecteur donné
	    if (that.optio.vva_selct_surlg != "") {
		  that.jQuery(""+that.optio.vva_selct_surlg)
		    .addClass(that.optio.vva_clas_css_surlg);
		}		
		
        that.jQuery(".group_entet.entet",that.table).show();
        
        // Afficher la région le temps après sa transformation
        that.jQuery(that.table).show();
      }
      
      eval(pjs_calbc);
    }; //END trans_raprt_sql
    
    return that;
  } //END group_entet_raprt_sql
}

afw.sie_21.actio_dynmq.group_entet_raprt_sql.trans_raprt_sql_orign = afw.sie_21.actio_dynmq.trans_raprt_sql;

afw.sie_21.actio_dynmq.trans_raprt_sql = function(pId) {
  afw.sie_21.actio_dynmq.group_entet_raprt_sql.trans_raprt_sql_orign(pId);
  
  // Transformer l'entête du rapport
  if(!afw.jQuery.isEmptyObject(vjs_insta = afw.sie_21.actio_dynmq.group_entet_raprt_sql.obten(pId))) {
    vjs_optio = vjs_insta.optio;
    afw.sie_21.actio_dynmq.group_entet_raprt_sql.suprm(pId);
    afw.sie_21.actio_dynmq.group_entet_raprt_sql.insta.push(new afw.sie_21.actio_dynmq.group_entet_raprt_sql.group_entet_raprt_sql(vjs_optio));
  }
};