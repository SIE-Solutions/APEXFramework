/*TODO: faire le ménage là dedans*/

afw.sie_13.plugn_popup_retr = function(seqnc, afich) {
  var fentr_sourc = window.opener;
  
  if (fentr_sourc.popup_retr.vva_item_seqnc) {
    //fentr_sourc.afw.item(fentr_sourc.popup_retr.vva_item_seqnc).setValue(seqnc);
    fentr_sourc.afw.jQuery('#'+fentr_sourc.popup_retr.vva_item_seqnc).val(seqnc);
  }
  if (fentr_sourc.popup_retr.vva_item_afich) {
    fentr_sourc.apex.item(fentr_sourc.popup_retr.vva_item_afich).setValue(afich);
  }

  if (fentr_sourc.popup_retr.vva_reqst) {
    fentr_sourc.apex.submit(fentr_sourc.popup_retr.vva_reqst);
  }
  
  window.close();
};

(function($){
  $.widget("ui.sie_13_plugn_popup", {
    options: {
      vva_url: "",
      vva_nom: "_blank",
      vva_largr : 600,
      vva_hautr: 600,
      vva_toolb: "no",
      vva_scrol: "yes",
      vva_titl: "yes",
      vva_loctn: "no",
      vva_stats: "no",
      vva_menub: "no",
      vva_reszb: "yes",
      vjs_popup_retr: {
        vva_item_seqnc: "",
        vva_item_afich: "",
        calbc: "",
        vva_reqst: "",
        vjs_objet_init: {}
      }
    },
    values: {
      vbo_modif_item: false
    },
    _init: function() {
      apex.debug('ui.sie_13_plugn_popup');
      
      var popup = this;
      
      var deflt = {
        vva_url: "",
        vva_nom: "_blank",
        vva_largr : 600,
        vva_hautr: 600,
        vva_toolb: "no",
        vva_scrol: "yes",
        vva_titl: "yes",
        vva_loctn: "no",
        vva_stats: "no",
        vva_menub: "no",
        vva_reszb: "yes",
        vjs_popup_retr: {
          vva_item_seqnc: "",
          vva_item_afich: "",
          calbc: "",
          vva_reqst: "",
          vjs_objet_init: {}
        }
      };
      
      popup.options = $.extend(deflt, popup.options);
      
      window.popup_retr = popup.options.vjs_popup_retr;
      //window.popup_retr.calbc = popup.options.calbc;
      
      v_popup = window.open(
        popup.options.vva_url
        ,popup.options.vva_nom
        , "toolbar="+popup.options.vva_toolb
         +",scrollbars="+popup.options.vva_scrol
         +",location="+popup.options.vva_loctn
         +",status="+popup.options.vva_stats
         +",menubar="+popup.options.vva_menub
         +",resizable="+popup.options.vva_reszb
         +",width="+popup.options.vva_largr
         +",height="+popup.options.vva_hautr
         +",titlebar="+popup.options.vva_titl
      );
      
      if (v_popup.opener === null){
        v_popup.opener = self;
      }
      
      v_popup.focus();
      
    }
  });
})(that.jQuery);

var g_request="";

function sem_calbc_selct_espac_docmn (ok)
{
  if (ok)
  {
    if (g_request != "")
      doSubmit (g_request);
  }
}

function sem_selct_espac_docmn (app_id, session, sidf, request, id_champ_docmn)
{
  var url = "f?p=" + app_id + ":6110:" + session + ":::RIR:SIDF:" + sidf;
  g_request = request;
  sie_PopUp (url, "Attacher_document", 800, 600, 'no', 'no',
              ById(id_champ_docmn), null, sem_calbc_selct_espac_docmn);
}

function sem_selct_logo (app_id, session, sidf, id_champ_seqnc, id_champ_nom)
{
  var url = "f?p=" + app_id + ":6100:" + session + ":::RIR:SIDF:" + sidf;
  sie_PopUp (url, "selct_logo", 800, 600, 'no', 'no',
              ById(id_champ_seqnc), ById(id_champ_nom));
}

var g_champ_html;
var g_div_html;

function sem_calbc_editr_html (ok, extra)
{
  if (ok)
  {
    g_champ_html.value = extra.html;
    g_div_html.innerHTML = extra.html + "&nbsp;";
  }
}

function sem_editr_html (app_id, session, sidf, id_champ_html, id_div_html)
{
  var url = "f?p=" + app_id + ":10:" + session + "::::SIDF:" + sidf;

  g_champ_html = ById(id_champ_html);
  g_div_html = ById(id_div_html);

  sie_PopUp (url, "editr_html", 640, 480, 'no', 'no', null, null,
    sem_calbc_editr_html, null, {html: g_champ_html.value});
}


function sem_calbc_selct_dosr (ok, extra)
{
  if (ok)
  {
    if (g_request != "")
      //doSubmit (g_request);
      apex.submit(window.popup_retr.vva_reqst);
  }
}

function sem_selct_dosr (app_id, session, sidf, id_champ_seqnc, request)
{
  //var url = "f?p=" + app_id + ":6120:" + session + ":::RIR:SIDF:" + sidf;
  //g_request = request;
  
  /*sie_PopUp (url, "selct_dosr", 800, 600, 'no', 'no',
              ById(id_champ_seqnc), null, sem_calbc_selct_dosr);*/
  
  afw.jQuery(document).sie_13_plugn_popup({
    vva_url: "f?p=" + app_id + ":6120:" + session + ":::RIR:SIDF:" + sidf,
    vva_nom: "selct_dosr",
    vva_largr: 800,
    vva_hautr: 600,
    vva_scrol: "no",
    vva_reszb: "no",
    vjs_popup_retr: {
      item_seqnc: apex.item(id_champ_seqnc),
      calbc: sem_calbc_selct_dosr,
      vva_reqst: request
    }
  });
}
