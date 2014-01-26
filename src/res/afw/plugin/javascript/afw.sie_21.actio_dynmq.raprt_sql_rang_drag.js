/**
 * @namespace afw.sie_21.actio_dynmq.raprt_sql_rang_drag
 */
afw.sie_21.actio_dynmq.raprt_sql_rang_drag = {
	insta : [],
	obten : function(pva_id) {
		var vjs_insta;

		for ( i = 0; i < afw.sie_21.actio_dynmq.raprt_sql_rang_drag.insta.length; i++) {
			if (afw.sie_21.actio_dynmq.raprt_sql_rang_drag.insta[i].optio.vva_id_regn == pva_id) {
				vjs_insta = afw.sie_21.actio_dynmq.raprt_sql_rang_drag.insta[i];
				break;
			}
		}

		return vjs_insta;
	},
	suprm : function(pva_id) {
		for ( i = 0; i < afw.sie_21.actio_dynmq.raprt_sql_rang_drag.insta.length; i++) {
			if (afw.sie_21.actio_dynmq.raprt_sql_rang_drag.insta[i].optio.vva_id_regn == pva_id) {
				afw.sie_21.actio_dynmq.raprt_sql_rang_drag.insta.splice(i, 1);
			}
		}
	},
	/**
	 * @constructor
	 */
	raprt_sql_rang_drag : function(pjs_optio, pjs_calbc) {
		var that = this;
		this.jQuery = afw.jQuery;
		this.node = false;
		this.id = false;
		this.table = false;
		this.initl = initl;
		this.trans_raprt_sql = trans_raprt_sql;

		this.optio = {
			vva_id_regn_reprt_catch : "",
			vva_id_regn_reprt : "",
			vva_id_regn : "",
			vva_clas_css_rang_drag : "",
			vva_aide : "clone",
			vbo_revnr : false,
			vnu_duree_revnr : 200,
			vva_selct_jquer_regn_drop : ".region_drop",
			vjs_ajax : {
				vva_async : false,
				vva_type_reqst : "POST",
				vva_reqst_url : "wwv_flow.show",
				vva_flow_id : afw.sie_11.prodt.obten_numr_apex(),
				vva_flow_step_id : afw.sie_13.page.obten_numr_apex(),
				vva_insta : afw.sie_07.sesn.obten_numr_apex(),
				vva_plugn_ajax : ""
			}
		};

		this.initl(pjs_optio, pjs_calbc);

		return that;

		function initl(pjs_optio, pjs_calbc) {
			//fusionner les options pass�es en param�tre et leurs valeurs par d�faut
			that.optio = that.jQuery.extend(that.optio, pjs_optio);

			if (that.jQuery("#" + that.optio.vva_id_regn_reprt_catch + " table").length > 0) {
				that.node = document.getElementById(that.optio.vva_id_regn_reprt_catch);
				that.table = that.jQuery("#" + that.optio.vva_id_regn_reprt_catch + " table:first");
			} else {
				that.node = document.getElementById(that.optio.vva_id_regn_reprt);
				that.table = that.jQuery("#" + that.optio.vva_id_regn_reprt + " table:first");
			}

			if (that.node) {
				that.id = that.node.id;
				that.trans_raprt_sql(pjs_calbc);
			}
		};//END initl

		function trans_raprt_sql(pjs_calbc) {
			// Cacher la region le temps de faire sa transformation
			that.jQuery(that.table).hide();

			if (that.table.length > 0) {
				that.jQuery("tr.echo-report-row:not(':first')", that.table).addClass(that.optio.vva_clas_css_rang_drag);

				var c = {};

				that.jQuery("tr.echo-report-row:not(':first')", that.table).draggable({
					"helper" : that.optio.vva_aide,
					"revert" : that.optio.vva_revnr,
					"revertDuration" : that.optio.vnu_duree_revnr,
					"start" : function(event, ui) {
						c.tr = this;
						c.helper = ui.helper;
						that.jQuery(this).hide();
						afw.sie_21.regn.drop.obten(afw.jQuery(that.optio.vva_selct_jquer_regn_drop).attr("id")).activ();
					},
					"stop" : function(event, ui) {
						that.jQuery(this).show();
						afw.sie_21.regn.drop.obten(afw.jQuery(that.optio.vva_selct_jquer_regn_drop).attr("id")).desct();
					}
				});
			}

			// Afficher la r�gion apr�s sa transformation
			that.jQuery(that.table).show();

			eval(pjs_calbc);
		};//END trans_raprt_sql

		return that;
	} //END raprt_sql_rang_drag
}

afw.sie_21.actio_dynmq.raprt_sql_rang_drag.trans_raprt_sql_orign = afw.sie_21.actio_dynmq.trans_raprt_sql;

afw.sie_21.actio_dynmq.trans_raprt_sql = function(pId) {
	afw.sie_21.actio_dynmq.raprt_sql_rang_drag.trans_raprt_sql_orign(pId);

	// Transformer le rapport en matrice
	if (!afw.jQuery.isEmptyObject( vjs_insta = afw.sie_21.actio_dynmq.raprt_sql_rang_drag.obten(pId))) {
		vjs_optio = vjs_insta.optio;
		afw.sie_21.actio_dynmq.raprt_sql_rang_drag.suprm(pId);
		afw.sie_21.actio_dynmq.raprt_sql_rang_drag.insta.push(new afw.sie_21.actio_dynmq.raprt_sql_rang_drag.raprt_sql_rang_drag(vjs_optio));
	}
};
