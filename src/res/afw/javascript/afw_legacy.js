/*
apex.submt_orign = apex.submit;
apex.submit = function(pOptions) {
  var vjs_deft = {
    request     : null,
    set         : null,
    showWait    : true,
    waitMsg     : null,
    form        : 'wwv_flow'
  };
  var vjs_optio = {};
  
  switch (typeof(pOptions)) {
      case 'string' : vjs_optio = afw.jQuery.extend(vjs_deft,{request : pOptions}); break;
      case 'object' : vjs_optio = afw.jQuery.extend(vjs_deft,pOptions); break;
      default : vjs_optio = vjs_deft; break;
  }
  
  apex.submt_orign(vjs_optio);
  
  
  //apex.submt_orign(pOptions);
  //vva_mesg = '<img class="soums_page_indic_charg" src="/res/sie/images/indic_charg.gif" />';
  //apex.jQuery.prompt(vva_mesg, { prefix: 'siesoums' });
  //apex.jQuery.prompt.close();
}
*/
/**
 * @deprecated
 * @function
 * */
function confirmDelete(pva_mesg, pva_reqt){
  afw.sie_13.page.confr_suprs({
    vva_mesg: pva_mesg,
    vva_reqt: pva_reqt
  });
}

/**
 * @deprecated
 * @function
 * */
function confr_suprs(pnu_seqnc, pva_reqt) {
  afw.sie_13.page.confr_suprs({
    vva_mesg: "Désirez-vous supprimer l'enregistrement?",
    vva_reqt: pva_reqt,
    vjs_item: {"SSPC": pnu_seqnc}
  });
}

/**
 * @deprecated
 * @function
 * */
function doSubmit2(r, n, param) {
  afw.sie_13.page.soumt_defnr_valr_item({
    vva_reqt: r, 
    vjs_item: {n:param}
  });
}

/**
 * @deprecated
 * @function
 * */
function doSubmit3(r, sidf, sspc, sapc, sspi, sapi) {
  afw.sie_13.page.soumt_defnr_valr_afw({
    vva_reqt: r, 
    vjs_item: {"SIDF":sidf,
               "SSPC":sspc,
               "SAPC":sapc,
               "SSPI":sspi,
               "SAPI":sapi}
  });
}




function goUrlBlank(url) 
{
 window.open(url); 
}

function obtnrDateDebutEfect(dateItem)
{
  if (dateItem.value=='')
  {
  var dateCourn = new Date();
  var annee = dateCourn.getUTCFullYear();
  var mois = dateCourn.getMonth() + 101;
  var jour = dateCourn.getDate() + 100;
  var strMois = mois.toString();
  var strJour = jour.toString();
  dateItem.value = annee.toString() + '-' + strMois.substr(1) + '-' + strJour.substr(1);
  }
}

function timestamp(){
   var d, s = "T:";
   var c = ":";
   d = new Date();
   s += d.getHours() + c;
   s += d.getMinutes() + c;
   s += d.getSeconds() + c;
   s += d.getMilliseconds();
   return(s);
}

/** 
 * @ignore
 * @function
 * @param pURL
 * @param pName
 * @param pWidth
 * @param pHeight
 * @param pScroll
 * @param pResizable
 * @return {Window Object}
 * */
function sie_PopUp (
  pURL,
  pName,
  pWidth,
  pHeight,
  pScroll,
  pResizable,
  pRetourObjSeqnc,
  pRetourObjAfich,
  pRetourCallback,
  pRequest,
  pObjInit
)
{
  var l_Window;
  
	if(!pURL){pURL = 'about:blank';}
	if(!pName){pName = '_blank';}
	if(!pWidth){pWidth = 600;}
	if(!pHeight){pHeight = 600;}
	if(!pScroll){pScroll = 'yes';}
	if(!pResizable){pResizable = 'yes';}
	if(!pRequest){pRequest = '';}
	if(!pObjInit){pObjInit = {};}

	window.RetourObjSeqnc = pRetourObjSeqnc;
	window.RetourObjAfich = pRetourObjAfich;
	window.RetourCallback = pRetourCallback;
	window.Request = pRequest;
	window.ObjInit = pObjInit;
	
	l_Window = window.open(pURL,pName,'toolbar=no,scrollbars='+pScroll+',location=no,statusbar=no,menubar=no,resizable='+pResizable+',width='+pWidth+',height='+pHeight);

	if (l_Window.opener === null){l_Window.opener = self;}
	l_Window.focus();

}


function sie_PopUp_retour (ok, seqnc, afich, extra)
{
  var fentr_sourc = window.opener;

  if (ok)
  {
    if (fentr_sourc.RetourObjSeqnc)
      fentr_sourc.RetourObjSeqnc.value = seqnc;
    if (fentr_sourc.RetourObjAfich)
      fentr_sourc.RetourObjAfich.value = afich;
  }

  if (fentr_sourc.RetourCallback)
    fentr_sourc.RetourCallback(ok, extra);
}


function sie_PopUp_calbc_deft (ok, extra)
{
  if (ok)
  {
    if (window.Request && window.Request != '')
    {
      apex.submit(window.Request);
    }
  }
}

/** 
 * @ignore 
 * */
function sie_afich_aide(curentItemId, appId, sessionId, closeButtonName){
    var closeButton;
    if (closeButtonName){closeButton = '&p_close_button_name='+closeButtonName;}
    else{closeButton = '';}
    //sie_PopUp("sie_01_gestn_mesg_aide.html?p_item_id=" + curentItemId + "&p_session=" + sessionId+closeButton,'Help',500,350);
    sie_PopUp("!sie_reprt.acept?p=" + appId + ":MESG_AIDE:" + sessionId + "&p_item_id=" + curentItemId + "&p_session=" + sessionId+closeButton,'Help',500,350);
    return;
}


function sie_largr_fentr()
{
  var largr =
    document.documentElement && document.documentElement.clientWidth ||
    document.body && document.body.clientWidth ||
    document.body && document.body.parentNode && document.body.parentNode.clientWidth ||
    0;
		
	return largr;
}

function sie_hautr_fentr()
{
  var hautr =
		document.documentElement && document.documentElement.clientHeight ||
		document.body && document.body.clientHeight ||
  	document.body && document.body.parentNode && document.body.parentNode.clientHeight ||
  	0;
  		
  return hautr;
}

function sie_obtnr_coord_absol (obj)
{
  var retrn = {};
	var obj_boucl = obj;
	var objx = objy = 0;
	while (obj_boucl)
	{
		objx += obj_boucl.offsetLeft;
		objy += obj_boucl.offsetTop;
    obj_boucl = obj_boucl.offsetParent;
	}
	retrn.x = objx;
	retrn.y = objy;
	
	return retrn;
}

function ById(id)
{
	return document.getElementById(id);
}

function Parent_ById(id)
{
	return window.parent.document.getElementById(id);
}

function sie_obtnr_selct (obj)
{
  var selct = {debut: 0, fin: 0};
  
  // Support pour IE
  if (document.selection)
  {
    obj.focus ();
    var sel_range = document.selection.createRange ();
    var obj_range = obj.createTextRange ();
    var taille_selct = sel_range.text.length;

    obj_range.moveToBookmark(sel_range.getBookmark());
    obj_range.moveStart ('character', -obj.value.length);

    selct.fin = obj_range.text.length;
    selct.debut = selct.fin - taille_selct;
  }
  // Support Firefox et autres
  else if (obj.selectionStart || obj.selectionStart == '0')
  {
    selct.debut = obj.selectionStart;
    selct.fin = obj.selectionEnd;
  }
  
  return selct;
}

function sie_defnr_selct (obj, debut, fin)
{
  if(obj.setSelectionRange)
  {
    obj.focus();
    obj.setSelectionRange(debut, fin);
  }
  else if (obj.createTextRange)
  {
    var obj_range = obj.createTextRange();
    obj_range.collapse(true);
    obj_range.moveEnd('character', fin);
    obj_range.moveStart('character', debut);
    obj_range.select();
  }
}

isTabFormColumn = function(pFieldId)
{
  // did we get a field?
  if (!pFieldId) return false;
  // look for the pattern f00_0000 or f00_0 and just contains this pattern
  if (pFieldId.search(/^f\d{2}\_\d{1,4}$/)==0) return true;
  return false;
}

getTabFormRow = function(pFieldId)
{
  if (isTabFormColumn(pFieldId))
  {
    return parseInt(pFieldId.substr(4), 10); 
  }
  return null;
}

lpad = function(pValue, pLength, pChar)
{
  var vChar   = (pChar)?pChar:" ";
  var vResult = String(pValue).toString();
  while (vResult.length<pLength)
  {
    vResult = vChar+vResult;
  }
  return vResult;
}

checkUpDownKey = function(pEvent)
{
  // only if the cursor is on a input field
  if (pEvent.target.nodeName != "INPUT") return;
  // if up or down has been pressed and no other key
  if ((pEvent.ctrlKey ==false) &&
      (pEvent.shiftKey==false) &&
      (pEvent.altKey  ==false) &&
      ((pEvent.metaKey==undefined) || (pEvent.metaKey==false)) &&
      ((pEvent.keyCode==38) || (pEvent.keyCode==40)) // up and down key
     )
  {
    // Is the current item a tabular form field?
    if (isTabFormColumn(pEvent.target.id))
    {
      // get next row depending on up/down key
      var vRow = getTabFormRow(pEvent.target.id)+((pEvent.keyCode==38)?-1:1);
      // get field of next row.
      // Note: Take care if it's a manual tabular form (no leading 0), because
      //       in that case use no leading 0s for the new vRow
      var vField = $x(pEvent.target.id.substr(0, 4)+
                      (($x(pEvent.target.id.substr(0, 4)+"1"))?vRow:lpad(vRow, 4, "0"))
                     );
      // only if it exists (in case we are on the first or last record)
      if (vField)
      {
        var vAutoComplete = vField.autocomplete;
        afw.jQuery(vField).attr("autocomplete", "off");        
        $(vField).parents('tr.sie_18_range_tablr_form').click();
        vField.focus();        
        afw.jQuery(vField).attr("autocomplete", vAutoComplete);
      }
    }
  }
}

function sie_do_blink (id_obj)
{
  var obj = document.getElementById(id_obj);
  
  //Prochaine valeur
  obj.blink.valeur += obj.blink.step;
  
  //Tester les limites, et changer le step de bord au besoin
  if (obj.blink.valeur <= obj.blink.min)
  {
    obj.blink.valeur = obj.blink.min;
    obj.blink.step = -obj.blink.step;
  }
  else if (obj.blink.valeur >= obj.blink.max)
  {
    obj.blink.valeur = obj.blink.max;
    obj.blink.step = -obj.blink.step;
    
    if (obj.blink.nb_blink > 0)
    {
      obj.blink.nb_blink--;
    }
  }
  
  //Ajuster l'opacit�
  obj.style.opacity = obj.blink.valeur;
  obj.style.filter = 'alpha(opacity=' + (obj.blink.valeur*100) + ')';
  
  //Continuer le timer
  if (obj.blink.nb_blink != 0)
  {
    obj.blink.timer = window.setTimeout ("sie_do_blink('" + id_obj + "')", obj.blink.interval);
  }
}

function sie_blink (obj) {
  obj.blink = {
    nb_blink: -1,
    valeur: 1,
    min: 0.5,
    max: 1,
    step: -0.05,
    interval: 100
  };
  
  sie_do_blink (obj.id);
}