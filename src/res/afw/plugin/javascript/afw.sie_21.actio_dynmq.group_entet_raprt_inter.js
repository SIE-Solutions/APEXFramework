/**
 * @namespace afw.sie_21.actio_dynmq.group_entet_raprt_inter
 */
afw.sie_21.actio_dynmq.group_entet_raprt_inter = {
  insta: [],
  obten : function(pva_id_regn) {
    var vjs_insta;
    
    for (i=0; i<afw.sie_21.actio_dynmq.group_entet_raprt_inter.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.group_entet_raprt_inter.insta[i].optio.vva_id_regn == pva_id_regn) {
        vjs_insta = afw.sie_21.actio_dynmq.group_entet_raprt_inter.insta[i];
        break;
      }
    }
    
    return vjs_insta;
  },
  suprm : function(pva_id_regn) {
    for (i=0; i<afw.sie_21.actio_dynmq.group_entet_raprt_inter.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.group_entet_raprt_inter.insta[i].optio.vva_id_regn == pva_id_regn) {
        afw.sie_21.actio_dynmq.group_entet_raprt_inter.insta.splice(i,1);
      }
    }
  },
  /**
  * @constructor
  */
  group_entet_raprt_inter : function(pjs_optio, pjs_calbc) {
    var that                        = this;
    this.node                       = false;
    this.id                         = false;
    this.table                      = false;
    this.jQuery                     = afw.jQuery;
    this.initl                      = initl;
    this.trans_raprt_inter          = trans_raprt_inter;
	this.ajout_ventl				= ajout_ventl;
    
    this.optio = {
      vva_id_regn:              "",
      var_ligne_1:              [],
      var_ligne_2:              [],
      var_ligne_3:              [],
	  var_trans_libl_raprt: 	[],
	  vbo_gerer_ventl:			false,
	  vva_clas_css_ventl:		"",  //ir_seprt_sectn
	  vva_clas_css_ventl_horzn: "",  //ir_seprt_sectn_horzn
	  vva_clas_css_ventl_vertc: "",  //ir_seprt_sectn_vertc
	  vva_clas_css_ventl_gauch: "",  //ir_seprt_sectn_gauch
	  vva_clas_css_surlg:		"",
	  vva_selct_surlg:			"",
	  vva_libl_entet:			"",  //libl_entet, à gérer plus tard
      var_ligne_suplm:          [],  //lignes_suprs, à gérer plus tard, ne semble pas être utilisé souvent
      vnu_nombr_coln_gauch:     1,	 //nombr_coln_gauch
      vnu_nombr_coln_seprt:     1,   //nombr_coln_seprt, à gérer plus tard
      vnu_nombr_coln_ventl:     0,   //nombr_coln_ventl
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
      
      if (that.jQuery("#apexir_REGION_ID[value='"+that.optio.vva_id_regn+"']").length > 0) {
        
        //apex.jQuery("#apexir_REGION_ID[value='R10282518993693178']").next('#apexir_WORKSHEET_REGION')
      
        that.node = that.jQuery("#apexir_REGION_ID[value='"+that.optio.vva_id_regn+"']").get(0);
        that.table = that.jQuery("#apexir_REGION_ID[value='"+that.optio.vva_id_regn+"']").next('#apexir_WORKSHEET_REGION').find(".apexir_WORKSHEET_DATA");
      }
      
      if(that.node){
        that.id = that.node.id;
        that.trans_raprt_inter(pjs_calbc);  
      }
    }; //END initl
	
    function trans_raprt_inter(pjs_calbc) {    
	  var vnu_nombr_coln_reel;
	  var vnu_nombr_coln;
      if (that.table.length > 0) {
        // Cacher la région le temps de faire sa transformation
        that.jQuery(that.table).hide();
		
	    //Modifier les entêtes si il y a plus de colonnes réelles que celles présentes dans les tableaux d'entêtes
	    vnu_nombr_coln_reel = that.jQuery("tr:first th",that.table).length;
	    vnu_nombr_coln = 0;        

		//Gérer la demande de ventilation (column break)
		if(that.optio.vbo_gerer_ventl) {
		  that.ajout_ventl();
		  vnu_nombr_coln_reel -= that.optio.vnu_nombr_coln_gauch;
		}
		
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
            .html((that.optio.var_ligne_3[i].libl!="") ? "<div>"+that.optio.var_ligne_3[i].libl+"</div>" : "&nbsp;");
		  
		  if(!that.optio.vbo_gerer_ventl || i != 0) {
			vnu_nombr_coln += that.optio.var_ligne_3[i].colsp;
		  }
		  if(that.optio.vbo_gerer_ventl && i == 0) {
		    afw.jQuery("tr:first th:eq("+i+")",that.table)
			  .addClass(that.optio.vva_clas_css_ventl);
		  }
        }
		
	    //Ajouter les colonnes vides nécessaires
	    if (vnu_nombr_coln_reel > vnu_nombr_coln && vnu_nombr_coln > 0) {
	      for(i=0, nombr_range_i=vnu_nombr_coln_reel-vnu_nombr_coln; i<nombr_range_i; i++){
			  that.jQuery("tr:first",that.table).append('<th></th>');
	      }
		}  
	    vnu_nombr_coln = 0;
        
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
            .html((that.optio.var_ligne_2[i].libl!="") ? "<div>"+that.optio.var_ligne_2[i].libl+"</div>" : "&nbsp;");
		  
		  if(!that.optio.vbo_gerer_ventl || i != 0) {
			vnu_nombr_coln += that.optio.var_ligne_2[i].colsp;
		  }
		  if(that.optio.vbo_gerer_ventl && i == 0) {
		    afw.jQuery("tr:first th:eq("+i+")",that.table)
			  .addClass(that.optio.vva_clas_css_ventl);
		  }
        }

	    //Ajouter les colonnes vides nécessaires
	    if (vnu_nombr_coln_reel > vnu_nombr_coln && vnu_nombr_coln > 0) {
	      for(i=0, nombr_range_i=vnu_nombr_coln_reel-vnu_nombr_coln; i<nombr_range_i; i++){
			  that.jQuery("tr:first",that.table).append('<th></th>');
	      }
		}
	    vnu_nombr_coln = 0;
		
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
            .html((that.optio.var_ligne_1[i].libl!="") ? "<div>"+that.optio.var_ligne_1[i].libl+"</div>" : "&nbsp;");
		  
		  if(!that.optio.vbo_gerer_ventl || i != 0) {
		    vnu_nombr_coln += that.optio.var_ligne_1[i].colsp;
		  }
		  if(that.optio.vbo_gerer_ventl && i == 0) {
		    afw.jQuery("tr:first th:eq("+i+")",that.table)
			  .addClass(that.optio.vva_clas_css_ventl);
		  }
        }
 
	    //Ajouter les colonnes vides nécessaires
	    if (vnu_nombr_coln_reel > vnu_nombr_coln && vnu_nombr_coln > 0) {
	      for(i=0, nombr_range_i=vnu_nombr_coln_reel-vnu_nombr_coln; i<nombr_range_i; i++){
			  that.jQuery("tr:first",that.table).append('<th></th>');
	      }
		}
	    vnu_nombr_coln = 0;
		
	  // Transformer les libellés
	    for (i=0, nombr_range_i=that.optio.var_trans_libl_raprt.length; i<nombr_range_i; i++) {
	      if (that.optio.var_trans_libl_raprt[i].nouv_libl != "undefined") {
	        that.jQuery("th[id='"+that.optio.var_trans_libl_raprt[i].id+"'] div",that.table)
		      .html((that.optio.var_trans_libl_raprt[i].nouv_libl!="") ? that.optio.var_trans_libl_raprt[i].nouv_libl : "&nbsp;");
		  }
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
    }; //END trans_raprt_inter
	
	function ajout_ventl () {
		//ajouter des colonnes séparatrices entre les sections de gauche et de droite (ENTETE du tableau)
		for(i=0;i<that.optio.vnu_nombr_coln_seprt;i++){
			var $obj_coln_gauch_extre_droit_entet = afw.jQuery("tr th:nth-child("+(that.optio.vnu_nombr_coln_gauch+i)+")", that.table);
			var $obj_seprt_sectn_vertc_entet = $obj_coln_gauch_extre_droit_entet.clone()
                .text("")
                .addClass(that.optio.vva_clas_css_ventl_vertc);
			$obj_coln_gauch_extre_droit_entet.after(afw.jQuery($obj_seprt_sectn_vertc_entet));
		}
      
		//ajouter une ligne séparatrice entre les entêtes et les données
		var $obj_seprt_sectn_horzn = afw.jQuery("tr:first",that.table).clone()
            .addClass(that.optio.vva_clas_css_ventl_horzn);
		afw.jQuery("tr:first", that.table).after(afw.jQuery($obj_seprt_sectn_horzn));
		afw.jQuery("th",$obj_seprt_sectn_horzn).text("");

		afw.jQuery("tr:eq(1) th:lt("+that.optio.vnu_nombr_coln_gauch+")", that.table).each(function(j){
			//déplacer le libellé de l'entête dans la ligne séparatrice directement en dessous
			var $obj_ln = afw.jQuery("tr:eq(0) th:eq("+j+")", that.table);
			afw.jQuery(this).html(afw.jQuery($obj_ln).html())
                .addClass(that.optio.vva_clas_css_ventl);
			afw.jQuery($obj_ln).html('')
                .addClass(that.optio.vva_clas_css_ventl)
                .css({'verticalAlign':'bottom', 'textAlign':'right', 'padding':'3px'}); //Possiblement transformé ca en classe css
		});      
      
		//ajouter une colonne séparatrice entre les sections de gauche et de droite (CORPS du tableau)
		for(i=0;i<that.optio.vnu_nombr_coln_seprt;i++){
			var $obj_coln_gauch_extre_droit = afw.jQuery("tr td:nth-child("+(that.optio.vnu_nombr_coln_gauch+i)+")", that.table);
			var $obj_seprt_gauch = afw.jQuery("<td>&nbsp;</td>")
				.addClass(that.optio.vva_clas_css_ventl_vertc);
			$obj_coln_gauch_extre_droit.after(afw.jQuery($obj_seprt_gauch));
		}
      
		//ajouter un style css aux colonnes de la section de gauche
		for (i=1;i<=that.optio.vnu_nombr_coln_gauch;i++) {
			afw.jQuery("tr td:nth-child("+i+")", that.table)
				.addClass(that.optio.vva_clas_css_ventl_gauch); //vva_clas_css_ventl
		}
      
		//ajouter un libellé pour la ligne d'entête de la section de gauche
		var l_colspan = that.optio.vnu_nombr_coln_gauch + that.optio.vnu_nombr_coln_seprt;
		//supprimer les colonnes en trop
		for (i=1;i<l_colspan;i++) {
			afw.jQuery("tr:eq(0) th:eq(1)", that.table).remove();
		}
		//ajuster le colSpan (S majuscule important!) de la premiere cellule
		afw.jQuery("tr:eq(0) th:first", that.table)
			.attr("colSpan",l_colspan)
			.text(that.optio.vva_libl_entet);
      
   /*   
		//ajouter des lignes supplémentaires d'indicateurs
		var l_nombr_coln_droit = afw.jQuery("tr:eq(1) th:gt(0)", that.table).length;      
      
		for(i=0;i<o.lignes_suprs.length;i++) {
			$obj_ligne_supr = fadq.jQuery('<tr><th class="ir_seprt_sectn" colSpan="'+l_colspan+'" align="right"><div>'+o.lignes_suprs[i].libl+'</div></th><th colspan="'+l_nombr_coln_droit+'" align="left"><div>'+o.lignes_suprs[i].valr+'</div></th></tr>')
			fadq.jQuery('.apexir_WORKSHEET_DATA tr:first').before(fadq.jQuery($obj_ligne_supr));
		}
    */        
		//ventilation (column break)
		var l_ventl;
		for (i=1;i<=that.optio.vnu_nombr_coln_ventl;i++) {
			afw.jQuery("tr td:nth-child("+i+")", that.table).each(function(j){
			if (!l_ventl) {
				l_ventl = afw.jQuery(this).text();
			}
			else if (l_ventl == afw.jQuery(this).text() && afw.jQuery(this).prev().text()=="") {
				afw.jQuery(this).text("");
			}
			else if (l_ventl != afw.jQuery(this).text()) {
				l_ventl = afw.jQuery(this).text();
			}
			});
			l_ventl = null;
		}
	}; //END ajout_ventl
	
    return that;
  } //END group_entet_raprt_inter
}

afw.sie_21.actio_dynmq.group_entet_raprt_inter.trans_raprt_inter_orign = afw.sie_21.actio_dynmq.trans_raprt_inter;

afw.sie_21.actio_dynmq.trans_raprt_inter = function(pId) {
  afw.sie_21.actio_dynmq.group_entet_raprt_inter.trans_raprt_inter_orign(pId);

  // Transformer l'entête du rapport
  if(!afw.jQuery.isEmptyObject(vjs_insta = afw.sie_21.actio_dynmq.group_entet_raprt_inter.obten(pId))) {
    vjs_optio = vjs_insta.optio;
    afw.sie_21.actio_dynmq.group_entet_raprt_inter.suprm(pId);
    afw.sie_21.actio_dynmq.group_entet_raprt_inter.insta.push(new afw.sie_21.actio_dynmq.group_entet_raprt_inter.group_entet_raprt_inter(vjs_optio));
  }
};