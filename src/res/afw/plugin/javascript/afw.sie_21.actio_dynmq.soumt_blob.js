/*
 /**
 * @namespace afw.sie_21.actio_dynmq.soumt_blob
 */
afw.sie_21.actio_dynmq.soumt_blob = {
    insta : [],
    obten : function(pnu_id) {
        for( i = 0; i < afw.sie_21.actio_dynmq.soumt_blob.insta.length; i++) {
            if(afw.sie_21.actio_dynmq.soumt_blob.insta[i].id == pnu_id) {
                return afw.sie_21.actio_dynmq.soumt_blob.insta[i];
            }
        }
    },
    suprm : function(pnu_id) {
        for( i = 0; i < afw.sie_21.actio_dynmq.soumt_blob.insta.length; i++) {
            if(afw.sie_21.actio_dynmq.soumt_blob.insta[i].id == pnu_id) {
                afw.sie_21.actio_dynmq.soumt_blob.insta.splice(i, 1);
            }
        }
    },
    /**
     * @constructor
     */
    soumt_blob : function(pjs_optio, pjs_calbc) {
        this.jQuery                     = afw.jQuery;
        var that                        = this;
        this.id                         = false;
        this.initl                      = initl;
        this.vnu_nombr_telvr_blob       = 0;
        this.vva_mode_telvr             = 'DATA_URL';
        this._telvr_text                = _telvr_text;
        this._telvr_binary              = _telvr_binary;
        this._telvr_array_buffer        = _telvr_array_buffer;
        this._telvr_data_url            = _telvr_data_url;
        this._telvr_fichr               = _telvr_fichr;
        this._creer_colct_blob          = _creer_colct_blob;

        this.optio = {
            vnu_id_actio_dynmq : "",
            vva_html_id_actio_dynmq : "",
            vva_nom_plugn : "",
            vva_reqt_soums_page : "",
            var_liste_items : [],
            vbo_ckedt : true,
            vva_plugn_ajax : ""
        };

        this.initl(pjs_optio);

        return that;

        function initl(pjs_optio) {
            //fusionner les options passées en paramètre et leurs valeurs par défaut
            that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

            that.id = that.optio.vva_html_id_actio_dynmq;

            var vva_evenm_termn = "soumt_" + that.optio.vva_reqt_soums_page + ((that.optio.vva_reqt_soums_page != "") ? "_" : "") + "blob_termn";

            that.jQuery(document).bind(vva_evenm_termn, function(event, ui) {
                // apex.event.trigger(that.jQuery(document),event.type+that.optio.vva_nom_plugn);
            });

            that._creer_colct_blob();
            that.jQuery(document).trigger(vva_evenm_termn);

        }; //END initl

        function _debut_telvr() {
            that.vnu_nombr_telvr_blob++;
            apex.event.trigger(that.jQuery(document), "debut_telvr." + that.optio.vva_nom_plugn);
        }; //END _debut_telvr

        function _termn_telvr() {
            that.vnu_nombr_telvr_blob--;

            if (that.vnu_nombr_telvr_blob == 0) {
                apex.event.trigger(that.jQuery(document), "termn_telvr." + that.optio.vva_nom_plugn);
            }
        }; //END _termn_telvr

        function _telvr_text(p_fichr, pnu_index) {
            console.log("_telvr_text");
            _debut_telvr();
            var lectr_fichr = new FileReader();

            lectr_fichr.onprogress = function(evenm) {
                if ( evenm.lengthComputable ) {
                    var progress = that.jQuery("progress" ,"#fichr_"+p_fichr.seqnc).get(0);
                    progress.setAttribute('value', evenm.loaded);
                    progress.setAttribute('max', evenm.total);
                }
            };

            lectr_fichr.onload = function(evenm) {
            };

            lectr_fichr.onloadend = function(evenm) {
                console.log(p_fichr);

                var var_fichr = $s_Split(evenm.target.result, 4000);

                afw.jQuery.exec_aplic_procs({
                    "async" : true,
                    "plugn_ajax" : that.optio.vva_plugn_ajax,
                    "procs_retrn_data_type" : "text",
                    "widget_action" : "TELVR_BLOB",
                    "x01" : p_fichr.fichr.name,
                    "x02" : p_fichr.fichr.type,
                    "f01" : var_fichr,
                    "sucs_procs" : function(pjs_data) {
                        afw.sie_21.regn.telvr_fichr.insta[0].var_liste_fichr.liste_fichr[pnu_index].indic_a_telvr = false;
                        _termn_telvr();
                        if ( evenm.lengthComputable ) {
                            var progress = that.jQuery("progress" ,"#fichr_"+p_fichr.seqnc).get(0);
                            progress.setAttribute('value', evenm.total);
                            progress.setAttribute('max', evenm.total);
                            that.jQuery("progress" ,"#fichr_"+p_fichr.seqnc).after("100%");
                        }
                    }
                });
            };

            // Lecture du fichier
            lectr_fichr.readAsText(p_fichr.fichr);
        }; //END _telvr_text

        function _telvr_binary(p_fichr, pnu_index) {
            console.log("_telvr_binary");
            _debut_telvr();
            var lectr_fichr = new FileReader();

            lectr_fichr.onprogress = function(evenm) {
                if ( evenm.lengthComputable ) {
                    var progress = that.jQuery("progress" ,"#fichr_"+p_fichr.seqnc).get(0);
                    progress.setAttribute('value', evenm.loaded);
                    progress.setAttribute('max', evenm.total);
                }
            };

            lectr_fichr.onload = function(evenm) {
            };

            lectr_fichr.onloadend = function(evenm) {
                console.log(p_fichr);

                console.log(evenm.target.result);

                var var_fichr = $s_Split(evenm.target.result, 4000);

                afw.jQuery.exec_aplic_procs({
                    "async" : true,
                    "plugn_ajax" : that.optio.vva_plugn_ajax,
                    "procs_retrn_data_type" : "text",
                    "widget_action" : "TELVR_BLOB",
                    "x01" : p_fichr.fichr.name,
                    "x02" : p_fichr.fichr.type,
                    "f01" : var_fichr,
                    "sucs_procs" : function(pjs_data) {
                        afw.sie_21.regn.telvr_fichr.insta[0].var_liste_fichr.liste_fichr[pnu_index].indic_a_telvr = false;
                        _termn_telvr();
                        if ( evenm.lengthComputable ) {
                            var progress = that.jQuery("progress" ,"#fichr_"+p_fichr.seqnc).get(0);
                            progress.setAttribute('value', evenm.total);
                            progress.setAttribute('max', evenm.total);
                            that.jQuery("progress" ,"#fichr_"+p_fichr.seqnc).after("100%");
                        }
                    }
                });
            };

            // Lecture du fichier
            lectr_fichr.readAsBinaryString(p_fichr.fichr);
        }; //END _telvr_binary

        function _telvr_data_url(p_fichr, pnu_index) {
            console.log("_telvr_data_url");
            _debut_telvr();
            var lectr_fichr = new FileReader();

            lectr_fichr.onprogress = function(evenm) {
                if ( evenm.lengthComputable ) {
                    var progress = that.jQuery("progress" ,"#fichr_"+p_fichr.seqnc).get(0);
                    progress.setAttribute('value', evenm.loaded);
                    progress.setAttribute('max', evenm.total);
                }
            };

            lectr_fichr.onload = function(evenm) {
            };

            lectr_fichr.onloadend = function(evenm) {
                console.log(p_fichr);

                var var_fichr = $s_Split(evenm.target.result.replace(/^.*base64,/,""),4000);

                afw.jQuery.exec_aplic_procs({
                    "async" : true,
                    "plugn_ajax" : that.optio.vva_plugn_ajax,
                    "procs_retrn_data_type" : "text",
                    "widget_action" : "TELVR_BLOB",
                    "x01" : p_fichr.fichr.name,
                    "x02" : p_fichr.fichr.type,
                    "f01" : var_fichr,
                    "sucs_procs" : function(pjs_data) {
                        afw.sie_21.regn.telvr_fichr.insta[0].var_liste_fichr.liste_fichr[pnu_index].indic_a_telvr = false;
                        _termn_telvr();
                        if ( evenm.lengthComputable ) {
                            var progress = that.jQuery("progress" ,"#fichr_"+p_fichr.seqnc).get(0);
                            progress.setAttribute('value', evenm.total);
                            progress.setAttribute('max', evenm.total);
                            that.jQuery("progress" ,"#fichr_"+p_fichr.seqnc).after("100%");
                        }
                    }
                });
            };

            // Lecture du fichier
            lectr_fichr.readAsDataURL(p_fichr.fichr);
        }; //END _telvr_data_url

        function _telvr_array_buffer(p_fichr, pnu_index) {
            console.log("_telvr_array_buffer");
            _debut_telvr();
            var lectr_fichr = new FileReader();

            lectr_fichr.onprogress = function(evenm) {
                if ( evenm.lengthComputable ) {
                    var progress = that.jQuery("progress" ,"#fichr_"+p_fichr.seqnc).get(0);
                    progress.setAttribute('value', evenm.loaded);
                    progress.setAttribute('max', evenm.total);
                }
            };

            lectr_fichr.onload = function(evenm) {
            };

            lectr_fichr.onloadend = function(evenm) {
                console.log(p_fichr);

                var var_fichr = [];
                var offset = 0;
                var buff_length = evenm.target.result.byteLength;
                while (offset < buff_length) {
                    sliced = String.fromCharCode.apply("", new Uint8Array(evenm.target.result, offset, Math.min(4000, buff_length - offset)));
                    var_fichr.push(sliced);
                    offset += 4000;
                }

                afw.jQuery.exec_aplic_procs({
                    "plugn_ajax" : that.optio.vva_plugn_ajax,
                    "procs_retrn_data_type" : "text",
                    "widget_action" : "TELVR_BLOB",
                    "x01" : p_fichr.fichr.name,
                    "x02" : p_fichr.fichr.type,
                    "f01" : var_fichr,
                    "sucs_procs" : function(pjs_data) {
                        afw.sie_21.regn.telvr_fichr.insta[0].var_liste_fichr.liste_fichr[pnu_index].indic_a_telvr = false;
                        _termn_telvr();
                        if ( evenm.lengthComputable ) {
                            var progress = that.jQuery("progress" ,"#fichr_"+p_fichr.seqnc).get(0);
                            progress.setAttribute('value', evenm.total);
                            progress.setAttribute('max', evenm.total);
                            that.jQuery("progress" ,"#fichr_"+p_fichr.seqnc).after("100%");
                        }
                    }
                });
            };

            // Lecture du fichier
            lectr_fichr.readAsArrayBuffer(p_fichr.fichr);

        }; //END _telvr_array_buffer

        function _telvr_fichr() {
            //TODO::CARLO
			console.log(2);
            that.jQuery(afw.sie_21.regn.telvr_fichr.insta[0].var_liste_fichr.liste_fichr).each(function(i, fichr){
                if (fichr.indic_a_telvr ) {
                    switch(that.vva_mode_telvr)
                    {
                        case 'TEXT':
                            that._telvr_text(fichr, i);
                            break;
                        case 'BINARY':
                            that._telvr_binary(fichr, i);
                            break;
                        case 'ARRAY_BUFFER':
                            that._telvr_array_buffer(fichr, i);
                            break;
                        case 'DATA_URL':
                            that._telvr_data_url(fichr, i);
                        default:
                            break;
                    }
                }
            });
        }; //END _telvr_fichr

        function _creer_colct_blob() {
            afw.jQuery.exec_aplic_procs({
                "plugn_ajax" : that.optio.vva_plugn_ajax,
                "widget_action" : "CREER_COLCT_BLOB",
                "sucs_procs" : function(pjs_data) {
				    console.log("CREER_COLCT_BLOB js");
                    that._telvr_fichr();
                }
            });
        }; //END _creer_colct_blob

        return that;
    } //END soumt_blob
}