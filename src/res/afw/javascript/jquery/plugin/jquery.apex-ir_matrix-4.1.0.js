/*
 * jQuery APEX-Interactive-Report-Matrix
 * By: Louis-Guillaume Carrier-Bédard [http://lgcarrier.blogspot.com]
 * Version 0.0.2
 * Last Modified: 2009/07/17
 *
 * Copyright 2009 Louis-Guillaume Carrier-Bédard
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

(function ($) {
  $.trans_IR_matrix = function(optio,calbc) {
        
    var defau = {
       nombr_coln_gauch: 1
      ,nombr_coln_seprt: 1
      ,nombr_coln_ventl: 0
      ,libl_entet: ""
      ,lignes_suprs: []
      ,debug: false
    };
      
    var o = $.extend(defau, optio);
      
    if ($('#apexir_WORKSHEET').length > 0 &&
        $('.apexir_WORKSHEET_DATA .ir_seprt_entet').length == 0 &&
        $('.apexir_REPEAT_HEADING:first').length == 0 &&
        $('.ir_sectn_gauche').length == 0
       ) {
      
      //ajouter des colonnes séparatrices entre les sections de gauche et de droite (ENTETE du tableau)
      for(i=0;i<o.nombr_coln_seprt;i++){
        var $obj_coln_gauch_extre_droit_entet = $('.apexir_WORKSHEET_DATA tr th:nth-child('+(o.nombr_coln_gauch+i)+')');
        var $obj_seprt_sectn_vertc_entet = $obj_coln_gauch_extre_droit_entet.clone()
                                                                            .text('')
                                                                            .addClass('ir_seprt_sectn_vertc');
        $obj_coln_gauch_extre_droit_entet.after($($obj_seprt_sectn_vertc_entet));
      }
      
                  
      //ajouter une ligne séparatrice entre les entêtes et les données
      var $obj_seprt_sectn_horzn = $('.apexir_WORKSHEET_DATA tr:first').clone()
                                                                       .addClass('ir_seprt_sectn_horzn');
      $('.apexir_WORKSHEET_DATA tr:first').after($($obj_seprt_sectn_horzn));
      $('tr.ir_seprt_sectn_horzn th').text('');

      $('.apexir_WORKSHEET_DATA tr:eq(1) th:lt('+o.nombr_coln_gauch+')').each(function(j){
        //déplacer le libellé de l'entête dans la ligne séparatrice directement en dessous
        var $obj_ln = $('.apexir_WORKSHEET_DATA tr:eq(0) th:eq('+j+')');
        $(this).html($($obj_ln).html())
               .addClass('ir_seprt_sectn');
        $($obj_ln).html('')
                  .addClass('ir_seprt_sectn')
                  .css({'verticalAlign':'bottom', 'textAlign':'right', 'padding':'3px'});
      });      
      
      //ajouter une colonne séparatrice entre les sections de gauche et de droite (CORPS du tableau)
      for(i=0;i<o.nombr_coln_seprt;i++){
        var $obj_coln_gauch_extre_droit = $('.apexir_WORKSHEET_DATA tr td:nth-child('+(o.nombr_coln_gauch+i)+')');
        var $obj_seprt_gauch = $('<td>&nbsp;</td>').addClass('ir_seprt_sectn_vertc');            
        $obj_coln_gauch_extre_droit.after($($obj_seprt_gauch));
      }
      
      
      //ajouter un style css aux colonnes de la section de gauche
      for (i=1;i<=o.nombr_coln_gauch;i++) {
        $('.apexir_WORKSHEET_DATA tr td:nth-child('+i+')').addClass("ir_sectn_gauche");
      }
      
      //ajouter un libellé pour la ligne d'entête de la section de gauche
      var l_colspan = o.nombr_coln_gauch + o.nombr_coln_seprt;
      //supprimer les colonnes en trop
      for (i=1;i<l_colspan;i++) {
        $('.apexir_WORKSHEET_DATA tr:eq(0) th:eq(1)').remove();
      }
      //ajuster le colSpan (S majuscule important!) de la premiere cellule
      $('.apexir_WORKSHEET_DATA tr:eq(0) th:first').attr("colSpan",l_colspan).text(o.libl_entet);
      
      
      //ajouter des lignes supplémentaires d'indicateurs
      var l_nombr_coln_droit = $('.apexir_WORKSHEET_DATA tr:eq(1) th:gt(0)').length;      
      
      for(i=0;i<o.lignes_suprs.length;i++) {
        $obj_ligne_supr = $('<tr><th class="ir_seprt_sectn" colSpan="'+l_colspan+'" align="right"><div>'+o.lignes_suprs[i].libl+'</div></th><th colspan="'+l_nombr_coln_droit+'" align="left"><div>'+o.lignes_suprs[i].valr+'</div></th></tr>')
        $('.apexir_WORKSHEET_DATA tr:first').before($($obj_ligne_supr));
      }
            
      //ventilation (column break)
      var l_ventl;
      for (i=1;i<=o.nombr_coln_ventl;i++) {
        $('.apexir_WORKSHEET_DATA tr td:nth-child('+i+')').each(function(j){
          if (!l_ventl) {
            l_ventl = $(this).text();
          }
          else if (l_ventl == $(this).text() && $(this).prev().text()=='') {
            $(this).text('');
          }
          else if (l_ventl != $(this).text()) {
            l_ventl = $(this).text();
          }
        });
        l_ventl = null;
      }      
      
      //Mode DEBUG
      if(o.debug){
        console.log("execution de la fonction $.trans_IR_matrix();");
      }
      
      eval(calbc);
    }
  };    
})(jQuery);
