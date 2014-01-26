afw.sie_21.actio_dynmq.gestn_tablr_form = {
  initl : function() {
  },
  convr_ligne_titre : function (pva_type_champ_titre, pva_chain_indic_titre) {
    // Obtenir tous les champs de saisie
    var champ_input = document.getElementsByTagName("input");
    var champ       = null;
    
    // Boucler les champs trouvés
    for (var i = 0; i < champ_input.length; i++)
    {
      champ = champ_input[i];
    
      // S'il s'agit d'un champ de tabular form
      if (champ.id.match(/^[f][0-9]{2}_[0-9]{4}$/))
      {
        // Et qu'il correspond à un élément recherché
        // pva_type_champ_titre == Type de champ input (ex: "text" ou "hidden")
        // pva_chain_indic_titre == Chaine qui indique une ligne à mettre en titre 
        if (champ.type == pva_type_champ_titre && champ.value == pva_chain_indic_titre)
        {
          // Identifier la ligne de tableau (balise <tr>) contenant l'élément repéré
          var obj_tr = champ;
          while (obj_tr && obj_tr.tagName.toLowerCase() != "tr")
            obj_tr = obj_tr.parentNode;
          
          if (obj_tr)
          {
            /*// Chercher les champs de cette ligne
            var champs_ligne = obj_tr.getElementsByTagName("input");
            
            for (var j = 0; j < champs_ligne.length; j++)
            {
              var champ_cachr = champs_ligne[j];
              //Cacher le champ
              //champ_cachr.style.display = "none";

              //Chercher sa cellule
              /var obj_td = champ_cachr;
              while (obj_td && obj_td.tagName.toLowerCase() != "td" && obj_td.tagName.toLowerCase() != "th")
                obj_td = obj_td.parentNode;
              
              //Ajouter un espace pour éviter que la cellule ne disparaisse
              if (obj_td)
              {
                obj_td.innerHTML += "&nbsp;";
              }
            }*/

            //Créer une nouvelle ligne pour l'entete
            var obj_table = obj_tr.parentNode;
            var nouv_tr = obj_table.insertRow(obj_tr.rowIndex + 1);
            
            //Dupliquer les cellules de la ligne originale
            for (var j = 0; j < obj_tr.cells.length; j++)
            {
              var obj_td = obj_tr.cells[j];
              var align = obj_td.getAttribute("align");
              
              if (align == null || align == "")
                align = "left";
              
              //nouv_tr.innerHTML += "<th class=\"t20ReportHeader\">" + obj_td.innerHTML + "</th>";
              var nouv_cell = document.createElement("th");
              nouv_cell.className = "t20ReportHeader";
              nouv_cell.setAttribute("align", align);
              nouv_cell.innerHTML = obj_td.innerHTML;

              nouv_tr.appendChild (nouv_cell);
            }
            
            //Supprimer la ligne originale
            obj_table.deleteRow(obj_tr.rowIndex);
          }
        }
      }
    }
  },
  numrt_apex_item : function (pnu_numr_coln) {
    var x_formt = "00" + pnu_numr_coln;
    x_formt = x_formt.substr(x_formt.length-2);

    var liste_champ = document.getElementsByName("f" + x_formt);

    for (var i = 0; i < liste_champ.length; i++)
    {
      // Identifier la ligne de tableau (balise <tr>) contenant l'élément repéré
      var obj_tr = liste_champ[i];
      while (obj_tr && obj_tr.tagName.toLowerCase() != "tr")
        obj_tr = obj_tr.parentNode;
      
      if (obj_tr)
      {
        var y_formt = "0000" + (obj_tr.rowIndex);
        y_formt = y_formt.substr(y_formt.length-4);
        
        liste_champ[i].id = "f" + x_formt + "_" + y_formt;
      }
    }
  },
  defnr_indic : function (
    type_champ,  // Type de champ input (ex: "text" ou "hidden") à traiter
    indic_a_trait, // Chaine qui indique un champ à traiter (ex: "O")
    declg_champ, // -1 pour champ précédent, 1 pour champ suivant
    cachr_champ, // true pour cacher le champ
    desct_champ, // true pour désactiver le champ
    calcl, // Structure d'objet décrivant le calcul à effectuer
    nb_decml, // Nombre de décimales ou "auto" (par défaut: 2)
    carct_decml) // Caractère de décimales (par défaut: ,)
  {

    // Obtenir tous les champs de saisie
    var champ_input = document.getElementsByTagName("input");
    var champ       = null;
    
    if (typeof nb_decml == "undefined")
      nb_decml = "auto";
    if (typeof carct_decml == "undefined")
      carct_decml = ",";
    
    // Boucler les champs trouvés
    for (var i = 0; i < champ_input.length; i++)
    {
      champ = champ_input[i];
    
      // S'il s'agit d'un champ de tabular form
      if (champ.id.match(/^[f][0-9]{2}_[0-9]{4}$/))
      {
        // Et qu'il correspond à un élément recherché
        if (champ.type == type_champ && champ.value == indic_a_trait)
        {
          // Construire le nom du champ à modifier
          var numr_coln = "00" + (parseInt(champ.id.substr(1,2), 10) + declg_champ) + "";
          numr_coln = numr_coln.substr(numr_coln.length-2);
          var numr_ligne = champ.id.substr(4);
          var nom_champ_action = "f" + numr_coln + "_" + numr_ligne;

          // Traiter le champ à modifier
          var champ_action = document.getElementById(nom_champ_action);
          if (champ_action)
          {
            if (cachr_champ)
            {
              champ_action.style.display = "none";
              //champ_action.type = "hidden";

              // Chercher la cellule dans laquelle il est positionné
              var obj_td = champ_action;
              while (obj_td && obj_td.tagName.toLowerCase() != "td" && obj_td.tagName.toLowerCase() != "th")
                obj_td = obj_td.parentNode;
              
              // Ajouter un espace pour éviter que la cellule ne disparaisse
              if (obj_td)
              {
                obj_td.innerHTML += "<div id=\"txt_" + nom_champ_action + "\">&nbsp;</div>";
              }
            }

            if (desct_champ)
            {
              champ_action.readOnly = true;
              champ_action.className = "sie_itf_desct";
            }

            // Créer l'objet "sie" associé au champ modifié
            champ_action.sie = {};
            champ_action.sie.nb_decml = nb_decml;
            champ_action.sie.carct_decml = carct_decml;

            if (typeof calcl != "undefined" && calcl !== null)
            {
              champ_action.sie.x = parseInt(numr_coln, 10);
              champ_action.sie.y = parseInt(numr_ligne, 10);
              champ_action.sie.calcl = calcl;
              champ_action.sie.table_champ = new Array();
              champ_action.sie.num_champ = 0;
              
              //g_champ = champ_action;
              obten_valr_calc (champ_action.sie.calcl, champ_action, true);
            }
            else
            {
              defnr_evenm_on_chang (champ_action, "formt");
              formt_champ (champ_action, champ_action.value);
            }
          }
        }
      }
    }
  }
}

/*****************************\
 Fonctions utilitaires
\*****************************/

// OBSOLETE
function sie_itf_numrt_apex_item (numr_coln)
{
  afw.sie_21.actio_dynmq.gestn_tablr_form.numrt_apex_item (numr_coln);
}

// OBSOLETE
function sie_itf_convr_ligne_titre (type_champ_titre, chain_indic_titre) {
  afw.sie_21.actio_dynmq.gestn_tablr_form.convr_ligne_titre (type_champ_titre,chain_indic_titre);
}

// OBSOLETE
function sie_itf_defnr_indic (type_champ, indic_a_trait, declg_champ, cachr_champ, desct_champ, calcl, nb_decml, carct_decml)
{
  afw.sie_21.actio_dynmq.gestn_tablr_form.defnr_indic (type_champ, indic_a_trait, declg_champ, cachr_champ, desct_champ, calcl, nb_decml, carct_decml);
}

function sie_itf_pret ()
{
  reclc_tout ();
}

/*****************************\
 Fonctions internes
\*****************************/
var g_arr_reclc = new Array();
//var g_champ;
var g_err_refrc_circl_trouve;

function defnr_evenm_on_chang (champ, action)
{
  if (!champ.sie)
    champ.sie = {};
   
  if (!champ.sie.indic_on_chang)
  {
    champ.sie.indic_on_chang = {};
    var ancien_onchange = champ.onchange;
    if (ancien_onchange)
    {
      champ.onchange = function () {
        ancien_onchange ();
        evenm_on_change (this);
      };
    }
    else
      champ.onchange = function () {
        evenm_on_change (this);
      };
  }
  if (action == "reclc")
    champ.sie.indic_on_chang.reclc = 1;
  else if (action == "formt")
    champ.sie.indic_on_chang.formt = 1;
}

function evenm_on_change (champ)
{
  if (champ.sie && champ.sie.indic_on_chang)
  {
    if (champ.sie.indic_on_chang.formt == 1)
      formt_champ (champ, champ.value);
    if (champ.sie.indic_on_chang.reclc == 1)
      reclc_tout ();
  }
}

/*function obten_obj_champ (x, y)
{
  var x_formt = "00" + x;
  x_formt = x_formt.substr(x_formt.length-2);
  var y_formt = "0000" + y;
  y_formt = y_formt.substr(y_formt.length-4);
  
  var nom_champ = "f" + x_formt + "_" + y_formt;
  var champ = document.getElementById(nom_champ);

  if (champ)
  {
    defnr_evenm_on_chang (champ, "reclc");
    return champ;
  }
  else
    return null;
}

function obten_valr_obj_champ (champ)
{
  if (champ)
  {
    if (champ.sie && champ.sie.calcl)
      reclc_champ (champ);
    
    var retour = parseFloat(champ.value.replace(/,/g, ".").replace(/ /g, ""));
    if (isNaN(retour))
      retour = 0;
    return retour;
  }
  else
    return 0;
}*/

function obten_valr_champ (x, y)
{
  var x_formt = "00" + x;
  x_formt = x_formt.substr(x_formt.length-2);
  var y_formt = "0000" + y;
  y_formt = y_formt.substr(y_formt.length-4);
  var retour;
  
  var nom_champ = "f" + x_formt + "_" + y_formt;
  var champ = document.getElementById(nom_champ);
  if (champ)
  {
    if (champ.sie && champ.sie.calcl)
    {
      reclc_champ (champ);
      retour = champ.sie.valeur_num;
    }
    else
    {
      retour = parseFloat(champ.value.replace(/,/g, ".").replace(/ /g, ""));
      if (isNaN(retour))
        retour = 0;
    }

    defnr_evenm_on_chang (champ, "reclc");

    return retour;
  }
  else
    return 0;
}

function obten_valr_calc (
  obj_calcl,
  obj_champ,
  mode_init)
{
  if (typeof (obj_calcl) == "object")
  {
    var fonct = obj_calcl[0].toLowerCase();
    var nb_par = obj_calcl.length;
    
    if (mode_init)
    {
      if (fonct == "cell")
      {
        // Évaluer les "offset" X et Y à l'initialisation, mais ne sera pas réévalué plus tard
        var x = (1 < nb_par) ? obten_valr_calc (obj_calcl[1], obj_champ, mode_init) : 0;
        var y = (2 < nb_par) ? obten_valr_calc (obj_calcl[2], obj_champ, mode_init) : 0;
        
        return obten_valr_champ (obj_champ.sie.x + x, obj_champ.sie.y + y);
        // Stocker une référence vers l'objet correspondant à la cellule demandée
        //g_champ.sie.table_champ[g_champ.sie.num_champ] = obten_obj_champ (g_champ.sie.x + x, g_champ.sie.y + y);
        //obj_calcl[3] = g_champ.sie.num_champ++;
      }
      else
      {
        for (var i = 1; i < nb_par; i++)
          obten_valr_calc (obj_calcl[i], obj_champ, mode_init);
      }
      return;
    }
    else
    {
      switch (fonct)
      {
        case "cell":
          var x = (1 < nb_par) ? obten_valr_calc (obj_calcl[1], obj_champ, mode_init) : 0;
          var y = (2 < nb_par) ? obten_valr_calc (obj_calcl[2], obj_champ, mode_init) : 0;
          
          return obten_valr_champ (obj_champ.sie.x + x, obj_champ.sie.y + y);
          //return obten_valr_obj_champ (obj_champ.sie.table_champ[obj_calcl[3]]);
        break;
        case "+":
          var total = (1 < nb_par) ? obten_valr_calc (obj_calcl[1], obj_champ, mode_init) : 0;
          for (var i = 2; i < nb_par; i++)
            total += obten_valr_calc (obj_calcl[i], obj_champ, mode_init);
          return total;
        break;
        case "-":
          var total = (1 < nb_par) ? obten_valr_calc (obj_calcl[1], obj_champ, mode_init) : 0;
          for (var i = 2; i < nb_par; i++)
            total -= obten_valr_calc (obj_calcl[i], obj_champ, mode_init);
          return total;
        break;
        case "*":
          var total = (1 < nb_par) ? obten_valr_calc (obj_calcl[1], obj_champ, mode_init) : 0;
          for (var i = 2; i < nb_par; i++)
            total *= obten_valr_calc (obj_calcl[i], obj_champ, mode_init);
          return total;
        break;
        case "/":
          var total = (1 < nb_par) ? obten_valr_calc (obj_calcl[1], obj_champ, mode_init) : 0;
          for (var i = 2; i < nb_par; i++)
            total /= obten_valr_calc (obj_calcl[i], obj_champ, mode_init);
          return total;
        break;
        case "somme":
          var x1 = (1 < nb_par) ? obten_valr_calc (obj_calcl[1], obj_champ, mode_init) : x_ref;
          var y1 = (2 < nb_par) ? obten_valr_calc (obj_calcl[2], obj_champ, mode_init) : y_ref;
          var x2 = (3 < nb_par) ? obten_valr_calc (obj_calcl[3], obj_champ, mode_init) : x1;
          var y2 = (4 < nb_par) ? obten_valr_calc (obj_calcl[4], obj_champ, mode_init) : y2;
          var step_x = (5 < nb_par) ? obten_valr_calc (obj_calcl[5], obj_champ, mode_init) : 1;
          var step_y = (6 < nb_par) ? obten_valr_calc (obj_calcl[6], obj_champ, mode_init) : 1;
  
          var total = 0;
          for (var j = y1; j <= y2; j += step_y)
            for (var i = x1; i <= x2; i += step_x)
              total += obten_valr_champ (obj_champ.sie.x + i, obj_champ.sie.y + j);
          return total;
        break;
        default:
          return 0;
        break;
      }
    }
  }
  else
    return obj_calcl;
}

function instr(strSearch, charSearchFor)
{
  for (i = 0; i < strSearch.length; i++)
  {
    if (charSearchFor == strSearch.substr(i, 1))
      return i;
  }
  return -1;
}

function formt_champ (champ, valr)
{
  var valeur_formt;

  var valr_texte = valr = valr.replace(/,/g, ".").replace(/ /g, "");

  if (champ.sie && (champ.sie.nb_decml == "auto" || champ.sie.nb_decml === ""))
    valeur_formt = "" + valr;
  else
  {
    var valeur_num = parseFloat(valr_texte);
    if (isNaN(valeur_num))
      valeur_num = 0;
    valeur_formt = valeur_num.toFixed(champ.sie.nb_decml);
  }
  
  var pos = instr(valeur_formt, ".");
  if (pos >= 0)
  {
    var ancie_integ = valeur_formt.substr(0, pos);
    var nouv_integ = "";

    while (ancie_integ.length > 3)
    {
      nouv_integ = " " + ancie_integ.substr(ancie_integ.length - 3, 3) + nouv_integ;
      ancie_integ = ancie_integ.substr(0, ancie_integ.length - 3);
    }
    valeur_formt = ancie_integ + nouv_integ + "." + valeur_formt.substr(pos + 1);
  }
  valeur_formt = valeur_formt.replace(/[.]/, champ.sie.carct_decml);
  champ.value = valeur_formt;
}

function reclc_champ (champ)
{
  var valeur_brute;

  if (typeof g_arr_reclc[champ.id] != "undefined")
  {
    //if (g_arr_reclc[champ.id] != "!") // N'est pas déjà calculé 
    if (g_arr_reclc[champ.id] == ".") // Est déjà en cours de calcul 
    {
      if (!g_err_refrc_circl_trouve)
      {
        g_err_refrc_circl_trouve = true;
        alert ("ERREUR: Référence circulaire rencontrée.");
      }
    }
  }
  else
  {
    g_arr_reclc[champ.id] = "."; // En cours...

    //g_champ = champ;
    champ.sie.valeur_num = obten_valr_calc (champ.sie.calcl, champ, false);
    valeur_brute = "" + champ.sie.valeur_num;
    formt_champ (champ, valeur_brute);

    g_arr_reclc[champ.id] = "!"; // Calculé!
  }
}

function reclc_tout ()
{
  // Obtenir tous les champs de saisie
  var champ_input = document.getElementsByTagName("input");
  var champ       = null;
  
  g_arr_reclc = new Array();
  g_err_refrc_circl_trouve = false;

  // Boucler les champs trouvés
  for (var i = 0; i < champ_input.length; i++)
  {
    champ = champ_input[i];
    
    if (champ.sie && champ.sie.calcl)
    {
      reclc_champ (champ);
    }
  }  
}
