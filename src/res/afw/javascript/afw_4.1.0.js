/**
 * @namespace afw.jQuery
 */
afw.jQuery = apex.jQuery;

/**
 * @namespace afw.theme
 */
afw.theme = {};

/**
 * @namespace afw.sie_01
 * @namespace afw.sie_04
 * @namespace afw.sie_07
 * @namespace afw.sie_11
 * @namespace afw.sie_12
 * @namespace afw.sie_13
 * @namespace afw.sie_14
 * @namespace afw.sie_18
 * @namespace afw.sie_19
 * @namespace afw.sie_21
 * @namespace afw.sie_25
 */
if (afw.sie_01 === null || typeof (afw.sie_01) != "object") {
    afw.sie_01 = {};
}
if (afw.sie_04 === null || typeof (afw.sie_04) != "object") {
    afw.sie_04 = {};
}
if (afw.sie_07 === null || typeof (afw.sie_07) != "object") {
    afw.sie_07 = {};
}
if (afw.sie_11 === null || typeof (afw.sie_11) != "object") {
    afw.sie_11 = {};
}
if (afw.sie_12 === null || typeof (afw.sie_12) != "object") {
    afw.sie_12 = {};
}
if (afw.sie_13 === null || typeof (afw.sie_13) != "object") {
    afw.sie_13 = {};
}
if (afw.sie_14 === null || typeof (afw.sie_14) != "object") {
    afw.sie_14 = {};
}
if (afw.sie_18 === null || typeof (afw.sie_18) != "object") {
    afw.sie_18 = {};
}
if (afw.sie_19 === null || typeof (afw.sie_19) != "object") {
    afw.sie_19 = {};
}
if (afw.sie_21 === null || typeof (afw.sie_21) != "object") {
    afw.sie_21 = {};
}
if (afw.sie_25 === null || typeof (afw.sie_25) != "object") {
    afw.sie_25 = {};
}

/**
 * @namespace afw.sie_01.mesg
 */
afw.sie_01.mesg = {
    afich_boite_mesg: function (pjs_optio) {
        //valeurs par défaut des options
        var vjs_deflt = {
            vva_mesg: "",
            vva_clas_mesgs: "",
            vva_clas_notfc: ""
        };

        //fusionner les options passées en paramètre et leurs valeurs par défaut
        var vjs_optio = afw.jQuery.extend(vjs_deflt, pjs_optio);

        var vob_boite_mesgs = afw.jQuery('#' + vjs_optio.vva_clas_mesgs);

        if (vob_boite_mesgs.length > 0) {
            /*vob_boite_mesgs.html('<div class="sie_boite_ronde boite_ereur" id="' + vjs_optio.vva_clas_notfc + '">' +
             '  <span class="sie_boite_ronde_0"></span>' +
             '  <span class="sie_boite_ronde_1"></span>' +
             '  <span class="sie_boite_ronde_2"></span>' +
             '  <span class="sie_boite_ronde_3"></span>' +
             '  <div class="sie_boite_ronde_contenu">' +
             '    <img src="/res/sie/theme/delete.gif" alt="Fermer" title="Fermer" onclick="$x_Remove(\'' + vjs_optio.vva_clas_notfc + '\')" style="float:right;" class="pb" />' +
             '    ' + vjs_optio.vva_mesg +
             '  </div>' +
             '  <span class="sie_boite_ronde_3"></span>' +
             '  <span class="sie_boite_ronde_2"></span>' +
             '  <span class="sie_boite_ronde_1"></span>' +
             '  <span class="sie_boite_ronde_0"></span>' +
             '</div>');*/

            vob_boite_mesgs.html('<div class="ui-widget" style="padding: 0 .7em;" id="' + vjs_optio.vva_clas_notfc + '">' + '  <div class="ui-state-error ui-corner-all" style="margin-bottom: 3px; padding: 0 .7em;">' + '    <p>' + '      <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>' + '      ' + vjs_optio.vva_mesg +
                /*'      <button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" style="float: right;" role="button" aria-disabled="false" title="Fermer le message." onclick="$x_Remove(\''+ vjs_optio.vva_clas_notfc +'\')"></span>' +
                 '      <span class="ui-button-icon-secondary ui-icon ui-icon-close"></span>' +
                 '      <span class="ui-button-text">Fermer le message.</span>' +
                 '      </button>' +*/
                '    </p>' + '  </div>' + '</div>');
        } else {
            // Si on ne trouve pas le div, on affiche le message d'erreur dans un 'alert'
            alert("Erreur(s) rencontrée(s): " + vjs_optio.vva_mesg);
        }
    },
    gestn_err_apex: function () {
        var vob_cook = document.cookie;
        var vnu_nombr_cook = 1;
        var vva_pile_errs = "";
        var vnu_pos = null;
        var vnu_debut = null;
        var vnu_fin = null;
        vnu_pos = vob_cook.indexOf("Mesg_Err_" + vnu_nombr_cook + "=");

        // Boucler à travers tous les cookies de messages d'erreurs
        while (vnu_pos != -1) {
            //
            vnu_debut = vob_cook.indexOf("=", vnu_pos) + 1;
            vnu_fin = vob_cook.indexOf(";", vnu_debut);
            if (vnu_fin < 0)
                vnu_fin = vob_cook.length;
            vva_pile_errs = vva_pile_errs + decodeURIComponent(vob_cook.substring(vnu_debut, vnu_fin));

            // Supprimer le cookie
            document.cookie = "Mesg_Err_" + vnu_nombr_cook + "=; max-age=0";

            // Lire le prochain cookie
            vnu_pos = vob_cook.indexOf("Mesg_Err_" + ++vnu_nombr_cook + "=");
        }

        // Quitter si aucune erreur trouvée
        if (vnu_nombr_cook == 1 || vva_pile_errs == "")
            return;

        afw.sie_01.mesg.afich_boite_mesg({
            vva_mesg: vva_pile_errs,
            vva_clas_mesgs: "sie_mesg_apex",
            vva_clas_notfc: "sie_mesg_ereur"
        });
    },
    trait_err_apex: function (pnu_forcr_mode_debug) {
        var vob_apex_err_page_mesg = afw.jQuery("div.ErrorPageMessage");
        var vob_sie_mesg_err = afw.jQuery("#sie_mesg_err");
        var vob_sie_bloc_err = afw.jQuery("#sie_bloc_err");

        var vva_pile_errs = null;
        var vbo_mode_debug = false;

        // Chercher les "div" de classe "ErrorPageMessage"
        vob_apex_err_page_mesg.each(function () {
            vva_pile_errs = (vva_pile_errs == null ? "" : vva_pile_errs + "<br />") + $(this).html();
        });
        // Si on a trouvé le "div" contenant le message
        if (vob_sie_mesg_err.length > 0 && vob_sie_mesg_err.html() != "") {
            vva_pile_errs = vob_sie_mesg_err.html() + (vva_pile_errs == null ? "" : "<br />" + vva_pile_errs);
        }

        if (afw.sie_07.debug.verif_debug_actif || pnu_forcr_mode_debug == 1) {
            // Afficher l'erreur directement à l'écran
            afw.sie_01.mesg.afich_boite_mesg({
                vva_mesg: vva_pile_errs,
                vva_clas_mesgs: "sie_bloc_err",
                vva_clas_notfc: "sie_mesg_ereur"
            });

            vob_sie_bloc_err.css("display", "block");
        } else {
            // Enregistrer le(s) message(s) d'erreur dans un ou des cookie(s)
            var vnu_nombr_cook = 0;
            var vva_valr_cook = null;
            // Découper en morceaux de 4k (arrondi à 4000 pour laisser un peu de souplesse...)
            while (vva_pile_errs != "") {
                vnu_nombr_cook++;
                vva_valr_cook = vva_pile_errs.substr(0, 4000);
                vva_pile_errs = vva_pile_errs.substr(4000);
                document.cookie = "Mesg_Err_" + vnu_nombr_cook + "=" + encodeURIComponent(vva_valr_cook);
            }

            // Revenir à la page précédente, qui lira les cookies et affichera les messages
            window.history.go(-1);
        }
    }
};

/**
 * @namespace afw.sie_04.contx
 */
afw.sie_04.contx = {
    obten_sidf: function () {
        return afw.jQuery("#SIDF").val();
    }
};

/**
 * @namespace afw.sie_07.sesn
 */
afw.sie_07.sesn = {
    /*DEPRECATED*/
    obten_numr_apex: function () {
        return afw.jQuery("#pInstance").val();
    }
};

/**
 * @namespace afw.sie_07.debug
 */
afw.sie_07.debug = {
    vnu_seqnc: 1,
    verif_debug_actif: ((afw.jQuery('#pdebug').length > 0) ? true : false),
    verif_consl_actif: ((window.console && console.log) ? true : false),
    trace: function (pjs_optio, pnu_forcr_debug) {
        var vjs_optio = {
            vva_mesg: "--trace--"
        };
        vjs_optio = afw.jQuery.extend(vjs_optio, pjs_optio);
        if (afw.sie_07.debug.verif_debug_actif || pnu_forcr_debug == 1) {
            if (afw.sie_07.debug.verif_consl_actif) {
                console.log('Trace debug: ' + afw.sie_07.debug.vnu_seqnc);
                console.log(vjs_optio.vva_mesg);
            } else {
                alert('Trace debug: ' + afw.sie_07.debug.vnu_seqnc);
                alert(vjs_optio.vva_mesg);
            }
            afw.sie_07.debug.vnu_seqnc++;
        }
    },
    deplc_apex_dev_tolbr: function () {
        afw.jQuery("#apex-dev-toolbar").appendTo("#sie_toolbar_bas");
    }
};

/**
 * @namespace afw.sie_07.temn
 */
afw.sie_07.temn = {
    defnr: function (pva_nom, pva_valr, pdt_expir) {
        var vdt_expir = new Date();
        vdt_expir.setDate(vdt_expir.getDate() + pdt_expir);
        document.cookie = pva_nom + "=" + escape(pva_valr) + ((pdt_expir == null) ? "" : ";expires=" + vdt_expir.toGMTString());
    },
    obten: function (pva_nom) {
        if (document.cookie.length > 0) {
            vva_debut_cok = document.cookie.indexOf(pva_nom + "=");
            if (vva_debut_cok != -1) {
                vva_debut_cok = vva_debut_cok + pva_nom.length + 1;
                c_end = document.cookie.indexOf(";", vva_debut_cok);
                if (c_end == -1)
                    c_end = document.cookie.length;
                return unescape(document.cookie.substring(vva_debut_cok, c_end));
            }
        }
        return "";
    }
};

/**
 * @namespace afw.ete
 */
afw.ete = function (pva_liste_mesg) {
    switch (typeof(pva_liste_mesg)) {
        case 'string':
            afw.sie_07.debug.trace({
                vva_mesg: pva_liste_mesg
            }, 1);
            break;
        case 'object':
            for (i = 0; i < pva_liste_mesg.length; i++) {
                afw.sie_07.debug.trace({
                    vva_mesg: pva_liste_mesg[i]
                }, 1);
            }
            break;
        default:
            break;
    }
};
/**
 * @namespace afw.sie_11.prodt
 */
afw.sie_11.prodt = {
    obten_numr_apex: function () {
        return afw.jQuery("#pFlowId").val();
    }
};

/**
 * @namespace afw.sie_12.sesn
 */
afw.sie_12.sesn = {
    obten_numr_apex: function () {
        return afw.jQuery("#pInstance").val();
    }
};

/**
 * @namespace afw.sie_12.favr
 */
afw.sie_12.favr = {
    _ajout: function (p_icone, pnu_struc_aplic, pnu_seqnc_struc_aplic) {
        var vjs_optio = {
            aplic_procs: 'SIE_12_FAVR_AJOUT_FAVR',
            x01: pnu_struc_aplic,
            x02: pnu_seqnc_struc_aplic,
            sucs_procs: function (p_data) {
                p_icone.toggleClass('icon-star');
                p_icone.toggleClass('icon-star-empty');
                p_icone.attr("title", p_data.title);
                //genr_sujet_favrs ();
                //afich_mesg_infor_apex ();
            }
        };
        apex.jQuery.exec_aplic_procs(vjs_optio);
    },
    _suprm: function (p_icone, pnu_struc_aplic, pnu_seqnc_struc_aplic) {
        var vjs_optio = {
            aplic_procs: 'SIE_12_FAVR_SUPRM_FAVR',
            x01: pnu_struc_aplic,
            x02: pnu_seqnc_struc_aplic,
            sucs_procs: function (p_data) {
                p_icone.toggleClass('icon-star');
                p_icone.toggleClass('icon-star-empty');
                p_icone.attr("title", p_data.title);
                //genr_sujet_favrs ();
                //afich_mesg_infor_apex ();
            }
        };
        apex.jQuery.exec_aplic_procs(vjs_optio);
    },
    ajout_suprm: function (pthis, pnu_struc_aplic, pnu_seqnc_struc_aplic) {
        icone = apex.jQuery(pthis);
        console.log(icone);
        //apex.jQuery('#UNE_REGION_X').html('<img src="/i/ws/ajax-loader.gif" alt="Chargement" title="Chargement" />');
        if (icone.hasClass('icon-star')) {
            afw.sie_12.favr._suprm(icone, pnu_struc_aplic, pnu_seqnc_struc_aplic);
        } else if (icone.hasClass('icon-star-empty')) {
            afw.sie_12.favr._ajout(icone, pnu_struc_aplic, pnu_seqnc_struc_aplic);
        }
    }
};

/**
 * @namespace afw.sie_13.page
 */
afw.sie_13.page = {
    afich_animt_charg: function () {
        apex.widget.waitPopup();
    },
    cachr_animt_charg: function () {
        afw.jQuery("#apex_wait_popup,#apex_wait_overlay").remove();
    },
    animt_charg: function (pbo_afich) {
        if (pbo_afich) {
            afw.sie_13.page.afich_animt_charg();
        } else {
            afw.sie_13.page.cachr_animt_charg();
        }
    },
    obten_numr_apex: function () {
        return afw.jQuery("#pFlowStepId").val();
    },
    soumt_defnr_valr_item: function (pjs_optio) {
        var vjs_deflt = {
            vva_reqt: "",
            vjs_item: null
        };
        var vjs_optio = afw.jQuery.extend(vjs_deflt, pjs_optio);
        apex.submit({
            request: vjs_optio.vva_reqt,
            set: vjs_optio.vjs_item
        });
    },
    soumt_defnr_valr_afw: function (pjs_optio) {
        var vjs_deflt = {
            vva_reqt: "",
            vjs_item: {
                "SIDF": null,
                "SSPC": null,
                "SAPC": null,
                "SSPI": null,
                "SAPI": null
            }
        };
        var vjs_optio = afw.jQuery.extend(vjs_deflt, pjs_optio);

        afw.sie_13.page.soumt_defnr_valr_item(vjs_optio);
    },
    confr_suprs: function (pjs_optio) {
        var vjs_deflt = {
            vva_mesg: "Désirez vous vraiment supprimer cet ou ces enregistrement(s)?",
            vva_reqt: "DELETE",
            vjs_item: null/*{"SSPC": null}*/
        };
        var vjs_optio = afw.jQuery.extend(vjs_deflt, pjs_optio);

        apex.confirm(vjs_optio.vva_mesg, {
            request: vjs_optio.vva_reqt,
            set: vjs_optio.vjs_item
        });
    },
    item: {
        genr_poubl: function () {
            afw.jQuery(".icon_poubl").click(function (i) {
                afw.jQuery(this).prev("span").contents("input").val("");
            });
        },
        obten_valr: function (pva_nom_item) {
            return afw.jQuery("#" + pva_nom_item).val();
        },
        defnr_valr: function (pva_nom_item, pva_valr_item) {
            afw.jQuery("#" + pva_nom_item).val(pva_valr_item);
        }
    },
    boutn: {
        cachr_boots_dropdown: function () {
            afw.jQuery(".btn-group .dropdown-menu").each(function (i) {
                if (afw.jQuery(this).children().length == 0) {
                    afw.jQuery(this).prev().hide();
                    afw.jQuery(this).parent().parent().children('button:last').addClass('notdropdown');
                }
            });

            afw.jQuery('.regn-toolbar-dropdown').show();
        }
    },
    raprt_sql: {
        deplc_rang_bas: function (pThis) {
            html_RowDown(pThis);
        },
        deplc_rang_haut: function (pThis) {
            html_RowUp(pThis);
        }
    }
};

/**
 * @namespace afw.sie_18.tablr_form
 */
afw.sie_18.tablr_form = {
    formt_overf: function (pnu_nombr_colnn_gauch) {
        afw.jQuery("#tablr_form_overf").hide();
        var table_droit = afw.jQuery("#tablr_form_overf").html();

        afw.jQuery("#tablr_form_overf table.t14Borderless tr").each(function (i) {
            afw.jQuery("th:gt(" + (pnu_nombr_colnn_gauch - 1) + "), td:gt(" + (pnu_nombr_colnn_gauch - 1) + ")", this).remove();
        })

        afw.jQuery("#tablr_form_overf table.t14Borderless:first").wrap('<div id="tablr_form_overf_gauch" />');

        afw.jQuery("#tablr_form_overf_gauch table:first").append('<tfoot>&nbsp;</tfoot>');

        afw.jQuery("#tablr_form_overf_gauch").after(table_droit);

        afw.jQuery("#tablr_form_overf table.t14Borderless:last").wrap('<div id="tablr_form_overf_droit" />');

        afw.jQuery("#tablr_form_overf_droit. tr").each(function (i) {
            afw.jQuery("th:lt(" + pnu_nombr_colnn_gauch + "), td:lt(" + pnu_nombr_colnn_gauch + ")", this).remove();
        })

        afw.jQuery('#tablr_form_overf_gauch tr:first, #tablr_form_overf_droit tr:first').addClass('tablr_form_entet');

        afw.jQuery("#tablr_form_overf").show();
    },
    ajout_rang: function (pnu_nombr_range) {
        for (i = 0; i < pnu_nombr_range; i++) {
            addRow();
        }
    }
};

/**
 * @namespace afw.sie_19.fonct
 */
afw.sie_19.fonct = {
    aide_page_item: {
        id_item: "",
        defnr_item: function (pnu_item_id_apex) {
            afw.sie_19.fonct.aide_page_item.id_item = pnu_item_id_apex;
        },
        fonct: "afw.jQuery.post('!sie_reprt.acept',{'p':[afw.sie_11.prodt.obten_numr_apex()+':SIE_19_AIDE_PAGE_ITEM:'+afw.sie_07.sesn.obten_numr_apex()],'pnu_sidf':[afw.sie_04.contx.obten_sidf()],'pnu_item_id_apex':[afw.sie_19.fonct.aide_page_item.id_item]}, function(data) {afw.jQuery.prompt(data, { prefix: 'sieprompt' });});"
    }
};

/**
 * @namespace afw.sie_19.cle
 */
afw.sie_19.cle = {
    exect_fonct_javsc: function (p_evt, p_param, p_preventDefault) {
        // Executer fonction javascript
        if (!!p_preventDefault) {
            p_evt.preventDefault();
        }
        eval(p_param);

        if (!!p_preventDefault) {
            return false;
        }
    },
    redrc_url: function (p_evt, p_param, p_preventDefault) {
        // Redirection vers un URL
        if (!!p_preventDefault) {
            p_evt.preventDefault();
        }

        window.location.href = p_param;

        if (!!p_preventDefault) {
            return false;
        }
    },
    pop_fentr_url: function (p_evt, p_param, p_preventDefault) {
        // Popup fen�tre URL
        if (!!p_preventDefault) {
            p_evt.preventDefault();
        }

        //TODO popup
        window.location.href = p_param;

        if (!!p_preventDefault) {
            return false;
        }
    },
    pop_modl_url: function (p_evt, p_param, p_preventDefault) {
        // Popup modal URL
        if (!!p_preventDefault) {
            p_evt.preventDefault();
        }

        eval(p_param);

        if (!!p_preventDefault) {
            return false;
        }
    },
    soums_reqt: function (p_evt, p_param, p_preventDefault) {
        // Soumettre la page avec une requ�te
        if (!!p_preventDefault) {
            p_evt.preventDefault();
        }

        doSubmit(p_param);

        if (!!p_preventDefault) {
            return false;
        }
    }
};

/**
 * @namespace afw.sie_19.boutn
 */
afw.sie_19.boutn = {
    fonct: {
        aide_page_item: "afw.sie_19.boutn.exect_fonct_javsc(afw.sie_19.fonct.aide_page_item.fonct);"
    },
    exect_fonct_javsc: function (p_param) {
        // Executer fonction javascript
        eval(p_param);
    },
    redrc_url: function (p_param) {
        // Redirection vers un URL
        window.location.href = p_param;
    },
    pop_fentr_url: function (p_param) {
        // Popup fen�tre URL
        //TODO popup
        window.location.href = p_param;
    },
    pop_modl_url: function (p_param) {
        // Popup modal URL
        eval(p_param);
    },
    soums_reqt: function (p_param) {
        // Soumettre la page avec une requ�te
        doSubmit(p_param);
    }
};

/**
 * @namespace afw.sie_19
 */
afw.sie_19.fonct.saf_chang_prodt = "afw.jQuery.post('!sie_reprt.acept',{'p':[afw.sie_11.prodt.obten_numr_apex()+':SAF_CHANG_PRODT:'+afw.sie_07.sesn.obten_numr_apex()],'pnu_sidf':[afw.sie_04.contx.obten_sidf()],'pva_sesn':[afw.sie_07.sesn.obten_numr_apex()]}, function(data) {afw.jQuery.prompt(data, { prefix: 'sieprompt' });});";

afw.sie_19.boutn.fonct.saf_chang_prodt = "afw.sie_19.boutn.exect_fonct_javsc(afw.sie_19.fonct.saf_chang_prodt);";

/**
 * @namespace afw.sie_25.entet_vertc
 */
afw.sie_25.entet_vertc = {
    formt: function () {
        if (afw.jQuery('#apexir_WORKSHEET .entet_vertc').length > 0) {
            //le code suivant devrait etre conditionnel pour ne pas transformer le IR s'il est d�j� transform�

            afw.jQuery('.entet_vertc').parents('th').width(10).height(210).css("verticalAlign", "bottom");

            if ($.browser.msie) {
                afw.jQuery('.entet_vertc').parent('div').width(10).height(180).css("overflow", "visible").css("vertical-align", "baseline");
            } else {
                afw.jQuery('.entet_vertc').parent('div').width(10);
            }

            afw.jQuery(".apexir_AGGREGATE_VALUE:contains('Somme: ')").each(function (i) {
                var vva_texte = afw.jQuery(this).text();
                afw.jQuery(this).text(vva_texte.substr(6));
            });
        }
    }
};

/**
 * @namespace afw.sie_07.json
 */
afw.sie_07.json = {
    convr_chain: function (pvj_json) {
        return JSON.stringify(pvj_json);
    },
    convr_objet: function (pva_chain) {
        return JSON.parse(pva_chain);
    }
};

/**
 * @namespace afw.sie_07.stock_local
 */
afw.sie_07.stock_local = {
    defnr_item: function (pva_nom, pva_valr) {
        if (typeof (pva_valr) == 'object') {
            pva_valr = afw.sie_07.json.convr_chain(pva_valr);
        }
        localStorage.setItem(pva_nom, pva_valr);
    },
    obten_item: function (pva_nom, pva_type) {
        vva_valr = localStorage.getItem(pva_nom);
        if (pva_type == "json") {
            return afw.sie_07.json.convr_objet(vva_valr);
        } else {
            return vva_valr;
        }
    },
    suprm_item: function (pva_nom) {
        localStorage.removeItem(pva_nom);
    },
    suprm_tous: function () {
        localStorage.clear();
    },
    obten_nombr_item: function () {
        return localStorage.length;
    },
    afich_tous: function () {
        for (var i = 0, vnu_nombr_item = localStorage.length; i < vnu_nombr_item; i++) {
            console.log(localStorage.key(i));
        }
    }
};

/**
 * @namespace afw.sie_07.stock_sesn
 */
afw.sie_07.stock_sesn = {
    defnr_item: function (pva_nom, pva_valr) {
        if (typeof (pva_valr) == 'object') {
            pva_valr = afw.sie_07.json.convr_chain(pva_valr);
        }
        sessionStorage.setItem(pva_nom, pva_valr);
    },
    obten_item: function (pva_nom, pva_type) {
        vva_valr = sessionStorage.getItem(pva_nom);
        if (pva_type == "json") {
            return afw.sie_07.json.convr_objet(vva_valr);
        } else {
            return vva_valr;
        }
    },
    suprm_item: function (pva_nom) {
        sessionStorage.removeItem(pva_nom);
    },
    suprm_tous: function () {
        sessionStorage.clear();
    },
    obten_nombr_item: function () {
        return sessionStorage.length;
    },
    afich_tous: function () {
        for (var i = 0, vnu_nombr_item = sessionStorage.length; i < vnu_nombr_item; i++) {
            console.log(sessionStorage.key(i));
        }
    }
};

/**
 * @namespace afw.sie_21
 */
afw.sie_21 = {
    regn: {},
    item: {},
    actio_dynmq: {}
};
