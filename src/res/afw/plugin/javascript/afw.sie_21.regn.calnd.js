/**
 * @author lgcarrierbedard
 * @namespace afw.sie_21.regn.calnd
 */

afw.sie_21.regn.calnd = {
  insta : [],
  obten : function(pnu_id) {
    for( i = 0; i < afw.sie_21.regn.calnd.insta.length; i++) {
      if(afw.sie_21.regn.calnd.insta[i].id == pnu_id) {
        return afw.sie_21.regn.calnd.insta[i];
      }
    }
  },
  suprm : function(pnu_id) {
    for( i = 0; i < afw.sie_21.regn.calnd.insta.length; i++) {
      if(afw.sie_21.regn.calnd.insta[i].id == pnu_id) {
        afw.sie_21.regn.calnd.insta.splice(i, 1);
      }
    }
  },
  /**
   * @constructor
   */
  calnd : function(pjs_optio, pjs_calbc) {
    this.jQuery = afw.jQuery;
    var that = this;
    this.node = false;
    this.id = false;
    this.var_evenm_sourc = [];
    this.var_liste_evenm = [];
    this.vjs_evenm_orign = {};

    this.vbo_stat_deplc = false;
    this.toltp_aide_insta = false;

    this.initl = initl;

    //Action sur le calendrier
    this.obten_calnd = obten_calnd;
    this._defnr_actio_selct = _defnr_actio_selct;
    this._defnr_actio_choix_evenm = _defnr_actio_choix_evenm;
    this._defnr_actio_deplc_evenm = _defnr_actio_deplc_evenm;

    //Gestion d'un événement
    this._ajout_evenm = _ajout_evenm;
    this._ajout_liste_evenm = _ajout_liste_evenm;
    this._suprm_evenm = _suprm_evenm;
    this._suprm_liste_evenm = _suprm_liste_evenm;
    this._modfr_liste_evenm = _modfr_liste_evenm;
    this.modfr_evenm = modfr_evenm;
    this._deplc_evenm_deprt = _deplc_evenm_deprt;
    this._deplc_evenm_fin = _deplc_evenm_fin;

    this._ajust_evenm = _ajust_evenm;
    this._detrm_heure_debut = _detrm_heure_debut;
    this._detrm_heure_fin = _detrm_heure_fin;

    //Aide instantannée
    this._afich_aide_insta = _afich_aide_insta;
    this._fermr_aide_insta = _fermr_aide_insta;
    this._suprm_toltp_aide_insta = _suprm_toltp_aide_insta;

    //Gestion des agendas
    this._genr_liste_evenm_agend = _genr_liste_evenm_agend;
    this._ajout_agend = _ajout_agend;
    this._suprm_agend = _suprm_agend;
    this.afich_liste_agend = afich_liste_agend;

    this.optio = {
      vva_mode_calnd : "agendaWeek",
      vjs_date_calnd : {
        vva_an : undefined,
        vva_mois : undefined,
        vva_jour : undefined
      },
      vbo_theme_jquer_ui : true,
      vjs_entet : {
        gauch : "",
        centr : "",
        droit : ""
      },
      vnu_premr_jour_semn : 0,
      vbo_afich_fin_semn : true,
      vva_afich_nombr_semn : "fixed", /* liquid variable */
      vjs_libl : {
        vjs_boutn : {
          vva_precd : "&nbsp;&#9668;&nbsp;", // left triangle
          vva_suivn : "&nbsp;&#9658;&nbsp;", // right triangle
          vva_an_precd : "&nbsp;&lt;&lt;&nbsp;", // <<
          vva_an_suivn : "&nbsp;&gt;&gt;&nbsp;", // >>
          vva_aujrd : "Aujourd'hui",
          vva_mois : "Mois",
          vva_semn : "Semaine",
          vva_jour : "Jour"
        },
        vjs_titre : {
          var_mois : ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"],
          var_abrev_mois : ["Jan", "Fev", "Mar", "Avr", "Mai", "Jun", "Jul", "Aoû", "Sep", "Oct", "Nov", "Dec"],
          var_jour : ["Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"],
          var_abrev_jour : ["Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam"],
          vva_journ_compl : "Journée"
        }
      },
      vjs_formt : {
        vjs_temps : {
          vva_agend : 'H:mm{ - H:mm}', // 5:00 - 18:30
          vva_autre : 'H:mm{ - H:mm}'
        },
        vjs_agend : {
          vva_formt_axe_y : "H:mm",
          vnu_nombr_mints : 15,
          vva_premr_heure : 8,
          vva_heure_debut : 8,
          vva_heure_fin : 17,
          vva_heure_debut_exten : undefined,
          vva_heure_fin_exten : undefined
        },
        vjs_coln : {
          vva_mois : "dddd", // Lundi
          vva_semn : "dddd, d", // Lundi 8 Sep
          vva_jour : ""            // ne pas afficher d'entête de colonne (on sauve ainsi une ligne qui répétait de l'information
        },
        vjs_titre : {
          vva_mois : "MMMM yyyy", // Septembre 2011
          vva_semn : "d MMMM yyyy {'au' d MMMM yyyy}", // 6 février au 12 février 2011
          vva_jour : "dddd, d MMMM, yyyy"                  // Lundi, 7 Février, 2011
        }
      },
      vbo_modfb : true,
      vva_id_regn : "",
      vva_nom_plugn : "",
      vva_clas_css : "regn_calnd",
      var_liste_agend : [],
      vva_async : true,
      vva_type_reqst : "POST",
      vva_reqst_url : "wwv_flow.show",
      vva_flow_id : afw.sie_11.prodt.obten_numr_apex(),
      vva_flow_step_id : afw.sie_13.page.obten_numr_apex(),
      vva_insta : afw.sie_07.sesn.obten_numr_apex(),
      vva_plugn_ajax : ""
    };

    this.initl(pjs_optio);

    return that;

    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

      try {
        that.node = document.getElementById(that.optio.vva_id_regn);
      } catch(e) {
        that.node = false;
      }

      if(that.node) {
        that.id = that.node.id;

        that.jQuery("#" + that.optio.vva_id_regn).addClass(that.optio.vva_clas_css).fullCalendar({
          defaultView : that.optio.vva_mode_calnd,
          /** General Display **/
          theme : that.optio.vbo_theme_jquer_ui,
          header : {
            left : that.optio.vjs_entet.gauch,
            center : that.optio.vjs_entet.centr,
            right : that.optio.vjs_entet.droit
          },
          firstDay : that.optio.vnu_premr_jour_semn,
          weekends : that.optio.vbo_afich_fin_semn,
          weekMode : that.optio.vva_afich_nombr_semn,
          viewDisplay : function(view) {
            apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "viewDisplay." + that.optio.vva_nom_plugn);
            that.jQuery.exec_aplic_procs({
              plugn_ajax : that.optio.vva_plugn_ajax,
              widget_action : "DEFNR_ETAT_CALND",
              x01 : view.name,
              x02 : view.calendar.getDate().getTime()
            });
          },
          windowResize : function(view) {
            apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "windowResize." + that.optio.vva_nom_plugn);
          },
          /** Agenda Options **/
          allDaySlot : false,
          allDayText : that.optio.vjs_libl.vjs_titre.vva_journ_compl,
          axisFormat : that.optio.vjs_formt.vjs_agend.vva_formt_axe_y,
          slotMinutes : that.optio.vjs_formt.vjs_agend.vnu_nombr_mints,
          firstHour : that.optio.vjs_formt.vjs_agend.vva_premr_heure,
          minTime : that.optio.vjs_formt.vjs_agend.vva_heure_debut,
          maxTime : that.optio.vjs_formt.vjs_agend.vva_heure_fin,
          /** Current Date **/
          year : that.optio.vjs_date_calnd.vva_an,
          month : that.optio.vjs_date_calnd.vva_mois,
          date : that.optio.vjs_date_calnd.vva_jour,
          /** Text/Time Customization **/
          timeFormat : {
            agenda : that.optio.vjs_formt.vjs_temps.vva_agend,
            '' : that.optio.vjs_formt.vjs_temps.vva_autre
          },
          columnFormat : {
            month : that.optio.vjs_formt.vjs_coln.vva_mois,
            week : that.optio.vjs_formt.vjs_coln.vva_semn,
            day : that.optio.vjs_formt.vjs_coln.vva_jour
          },
          titleFormat : {
            month : that.optio.vjs_formt.vjs_titre.vva_mois,
            week : that.optio.vjs_formt.vjs_titre.vva_semn,
            day : that.optio.vjs_formt.vjs_titre.vva_jour
          },
          buttonText : {
            prev : that.optio.vjs_libl.vjs_boutn.vva_precd,
            next : that.optio.vjs_libl.vjs_boutn.vva_suivn,
            prevYear : that.optio.vjs_libl.vjs_boutn.vva_an_precd,
            nextYear : that.optio.vjs_libl.vjs_boutn.vva_an_suivn,
            today : that.optio.vjs_libl.vjs_boutn.vva_aujrd,
            month : that.optio.vjs_libl.vjs_boutn.vva_mois,
            week : that.optio.vjs_libl.vjs_boutn.vva_semn,
            day : that.optio.vjs_libl.vjs_boutn.vva_jour
          },
          monthNames : that.optio.vjs_libl.vjs_titre.var_mois,
          monthNamesShort : that.optio.vjs_libl.vjs_titre.var_abrev_mois,
          dayNames : that.optio.vjs_libl.vjs_titre.var_jour,
          dayNamesShort : that.optio.vjs_libl.vjs_titre.var_abrev_jour,
          /** Clicking & Hovering **/
          dayClick : function(date, allDay, jsEvent, view) {
            apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "dayclick." + that.optio.vva_nom_plugn);
          },
          eventClick : function(event, jsEvent, view) {
              that._defnr_actio_choix_evenm(event, jsEvent, view);
          },
          eventMouseover : function(event, jsEvent, view) {
            apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "eventmouseover." + that.optio.vva_nom_plugn);
            that._afich_aide_insta(event, jsEvent, view);
          },
          eventMouseout : function(event, jsEvent, view) {
            apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "eventmouseout." + that.optio.vva_nom_plugn);
            that._fermr_aide_insta(event, jsEvent, view);
          },
          /** Selection **/
          selectable : true,
          selectHelper : true,
          unselectAuto : false,
          unselectCancel : "",
          select : function(startDate, endDate, allDay, jsEvent, view) {
            that._defnr_actio_selct(startDate, endDate, allDay, jsEvent, view);
          },
          unselect : function(view, jsEvent) {
            apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "unselect." + that.optio.vva_nom_plugn);
          },
          /** Event Data **/
          lazyFetching : false,
          eventSources : [],
          loading : function(isLoading, view) {
            afw.sie_13.page.animt_charg(isLoading);

            apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "loading." + that.optio.vva_nom_plugn);

            if(isLoading) {
              that._suprm_toltp_aide_insta();
              apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "loadingstart." + that.optio.vva_nom_plugn);
            } else {
              apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "loadingstop." + that.optio.vva_nom_plugn);
            }
          },
          /** Event Rendering **/
          eventRender : function(event, element, view) {
            apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "eventrender." + that.optio.vva_nom_plugn);
          },
          eventAfterRender : function(event, element, view) {
            apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "eventafterrender." + that.optio.vva_nom_plugn);
          },
          /** Event Dragging & Resizing **/
          editable : that.optio.vbo_modfb,
          eventDragStart : function(event, jsEvent, ui, view) {
            that.vbo_stat_deplc = true;
            that._suprm_toltp_aide_insta();
            that._deplc_evenm_deprt(event, jsEvent, ui, view);
          },
          eventDragStop : function(event, jsEvent, ui, view) {
            that.vbo_stat_deplc = false;
            that._deplc_evenm_fin(event, jsEvent, ui, view);
          },
          eventDrop : function(event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view) {
            that._defnr_actio_deplc_evenm(event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view);
          },
          eventResizeStart : function(event, jsEvent, ui, view) {
            apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "eventresizestart." + that.optio.vva_nom_plugn);
          },
          eventResizeStart : function(event, jsEvent, ui, view) {
            apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "eventresizestart." + that.optio.vva_nom_plugn);
          },
          eventResize : function(event, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view) {
            that._ajust_evenm(event, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view);
          },
          /** Dropping External Elements **/
          droppable : false,
          drop : function(date, allDay, jsEvent, ui) {
            apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "drop." + that.optio.vva_nom_plugn);
          }
        });
      }
    }; //END initl

    function obten_calnd() {
      return that.jQuery("#" + that.id).fullCalendar('getView').calendar;
    }; //END obten_calnd

    function _defnr_actio_selct(startDate, endDate, allDay, jsEvent, view) {
      that.jQuery.exec_aplic_procs({
        plugn_ajax : that.optio.vva_plugn_ajax,
        widget_action : "DEFNR_ACTIO_SELCT",
        x01 : (allDay) ? 'O' : 'N',
        x02 : that.jQuery.fullCalendar.formatDate(startDate, 'yyyyMMdd HH:mm'),
        x03 : that.jQuery.fullCalendar.formatDate(endDate, 'yyyyMMdd HH:mm'),
        sucs_procs : function() {
          apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "select." + that.optio.vva_nom_plugn);
        }
      });

      view.calendar.unselect();
    }; //END _defnr_actio_selct

    function _defnr_actio_choix_evenm(event, jsEvent, view) {
      var vnu_evenm_ident = event.ident;
      //obtenir tous les events qui ont le même event.ident
      that.var_liste_evenm = view.calendar.clientEvents(function(pjs_evenm) {
        if(pjs_evenm.ident == vnu_evenm_ident) {
          return true;
        } else {
          return false;
        }
      });

      that.jQuery.exec_aplic_procs({
        plugn_ajax : that.optio.vva_plugn_ajax,
        widget_action : "DEFNR_ACTIO_CHOIX_EVENM",
        x01 : event.ident,
        sucs_procs : function() {
          apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "eventclick." + that.optio.vva_nom_plugn);
        }
      });

      view.calendar.unselect();
    };  //END _defnr_actio_choix_evenm

    function _defnr_actio_deplc_evenm(event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view) {
      //TODO:: ALEX
      //Si l'event était toute la journée et devient sur une plage horaire

      var vda_date_fin;
      if(that.vjs_evenm_orign.allDay && !allDay) {
        //Générer la date de fin de journée
        if(event.end == null) {
          vda_date_fin = new Date(event.start.getTime());
        } else {
          vda_date_fin = new Date(event.end.getTime());
        }
        event.end = that.jQuery.fullCalendar.parseDate(vda_date_fin.toDateString());

        event.end.setHours(that.optio.vjs_formt.vjs_agend.vva_heure_fin);
        event.end.setMinutes(00);
        event.end.setSeconds(00);
      }
      //Sinon si l'event est déplacée d'une plage horaire vers une journée complète
      else if(!that.vjs_evenm_orign.allDay && allDay) {
        //Générer la date de fin de journée
        event.start.setHours(00);
        event.start.setMinutes(00);
        event.start.setSeconds(00);

        if(event.end != null) {
          vda_date_fin = new Date(event.end.getTime() - 86400);
          event.end = that.jQuery.fullCalendar.parseDate(vda_date_fin.toDateString());
          event.end.setHours(00);
          event.end.setMinutes(00);
          event.end.setSeconds(00);
        }
      }

      that.jQuery.exec_aplic_procs({
        plugn_ajax : that.optio.vva_plugn_ajax,
        widget_action : "DEFNR_ACTIO_DEPLC_EVENM",
        x01 : event.ident,
        x02 : (allDay) ? 'O' : 'N',
        x03 : that.jQuery.fullCalendar.formatDate(event.start, 'yyyyMMdd HH:mm'),
        x04 : that.jQuery.fullCalendar.formatDate(event.end, 'yyyyMMdd HH:mm'),
        sucs_procs : function() {

          var vnu_event_ident = event.ident;
          //obtenir tous les events qui ont le même event.ident
          that.var_liste_evenm = view.calendar.clientEvents(function(event) {
            if(event.ident == vnu_event_ident) {
              return true;
            } else {
              return false;
            }
          });
          for(var i = 0, vnu_nombr_evenm = that.var_liste_evenm.length; i < vnu_nombr_evenm; i++) {
            that.obten_calnd().updateEvent(that.var_liste_evenm[i]);
          }

          apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "eventdrop." + that.optio.vva_nom_plugn);
        }
      });

      view.calendar.unselect();
    }; //END _defnr_actio_deplc_evenm

    function _ajout_evenm(pjs_evenm) {
      if(that.var_evenm_sourc["agend_" + pjs_evenm.agend] != undefined) {
        var vjs_evenm = {
          title : pjs_evenm.titre,
          start : (pjs_evenm.date_journ_compl != "") ? that.jQuery.fullCalendar.parseDate(pjs_evenm.date_journ_compl) : that.jQuery.fullCalendar.parseDate(pjs_evenm.date_debut),
          end : (pjs_evenm.date_fin_journ_compl != "") ? that.jQuery.fullCalendar.parseDate(pjs_evenm.date_fin_journ_compl) : that.jQuery.fullCalendar.parseDate(pjs_evenm.date_fin),
          allDay : (pjs_evenm.indic_journ_compl == "true") ? true : false,
          className : pjs_evenm.clas_css,
          //url : pjs_evenm.row[0].lien,
          id : pjs_evenm.agend + ':' + pjs_evenm.ident,
          ident : pjs_evenm.ident,
          agend : pjs_evenm.agend,
          descr : pjs_evenm.descr,
          titre_aide_insta : pjs_evenm.titre_aide_insta,
          aide_insta : pjs_evenm.aide_insta
        };

        that.obten_calnd().renderEvent(vjs_evenm, true);

        //Lier le nouvel événement à un agenda
        vjs_evenm.source = that.var_evenm_sourc["agend_" + pjs_evenm.agend];

        that.obten_calnd().updateEvent(vjs_evenm);
      }
    }; //END _ajout_evenm

    function _ajout_liste_evenm(par_liste_evenm) {
      for(var i = 0, vnu_nombr_evenm = par_liste_evenm.length; i < vnu_nombr_evenm; i++) {
        that._ajout_evenm(par_liste_evenm[i]);
      }
    }; //END _ajout_liste_evenm

    //Possible de passer null, ce qui supprime tous les events, sinon un id
    function _suprm_evenm(pjs_evenm) {
      that.obten_calnd().removeEvents(pjs_evenm.id);
    }; //END _suprm_evenm

    function _suprm_liste_evenm(par_liste_evenm) {
      for(var i = 0, vnu_nombr_evenm = par_liste_evenm.length; i < vnu_nombr_evenm; i++) {
        that._suprm_evenm(par_liste_evenm[i]);
      }
      that.var_liste_evenm = [];
    }; //END _suprm_liste_evenm

    function _modfr_liste_evenm(par_liste_evenm) {
      /*
       that._suprm_liste_evenm(that.var_liste_evenm);
       that._ajout_liste_evenm(par_liste_evenm);
       */

      that.obten_calnd().refetchEvents();

    }; //END _modfr_liste_evenm

    function modfr_evenm(pva_ident) {
      that.jQuery.exec_aplic_procs({
        plugn_ajax : that.optio.vva_plugn_ajax,
        widget_action : "OBTEN_JSON_EVENM",
        x01 : pva_ident,
        sucs_procs : function(par_liste_evenm) {
          if(par_liste_evenm.row.length > 0) {
            that._modfr_liste_evenm(par_liste_evenm.row);
          } else {
            that._suprm_evenm(that.var_liste_evenm);
            that.var_liste_evenm = [];
          }
        }
      });
    }; //END modfr_evenm

    function _deplc_evenm_deprt(event, jsEvent, ui, view) {
      that.vjs_evenm_orign = {
        allDay : event.allDay,
        end : event.end
      };

      apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "eventdragstart." + that.optio.vva_nom_plugn);
    }; //END _deplc_evenm_deprt

    function _deplc_evenm_fin(event, jsEvent, ui, view) {
      apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "eventdragstop." + that.optio.vva_nom_plugn);
    }; //END _deplc_evenm_fin

    function _ajust_evenm(event, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view) {
      //Alimenter l'evenement du calendrier ("event")
      //that._trait_evenm_modfr(event, jsEvent, view);

      //Definir la nouvelle date fin et le séquence de l'event
      //that._alimn_enreg_evenm_ajax("MODFR_EVENM");
      //TODO::CARLO->  _modfr_liste_evenm va recevoir un array d'event
      //that._modfr_liste_evenm(event, jsEvent, view);
	  
	  //Ajout ALEX pour ajustement dans agenda SEM
      that.jQuery.exec_aplic_procs({
        plugn_ajax : that.optio.vva_plugn_ajax,
        widget_action : "DEFNR_ACTIO_AJUST_EVENM",
        x01 : event.ident,
        x02 : that.jQuery.fullCalendar.formatDate(event.end, 'yyyyMMdd HH:mm'),
        sucs_procs : function() {

          var vnu_event_ident = event.ident;
          //obtenir tous les events qui ont le même event.ident
          that.var_liste_evenm = view.calendar.clientEvents(function(event) {
            if(event.ident == vnu_event_ident) {
              return true;
            } else {
              return false;
            }
          });
          for(var i = 0, vnu_nombr_evenm = that.var_liste_evenm.length; i < vnu_nombr_evenm; i++) {
            that.obten_calnd().updateEvent(that.var_liste_evenm[i]);
          }

          apex.event.trigger(that.jQuery("#" + that.optio.vva_id_regn), "eventresize." + that.optio.vva_nom_plugn);
        }
      });
    }; //END _ajust_evenm

    //Probablement effaceer _detrm_heure_debut et _detrm_heure_fin
    function _detrm_heure_debut() {
      var vbo_exten = false;
      if(that.optio.vjs_formt.vjs_agend.vva_heure_debut_exten != undefined) {
        vbo_exten = true;
      }

      if(vbo_exten) {
        that.jQuery("#" + that.optio.vva_id_regn).fullCalendar('options', 'minTime', that.optio.vjs_formt.vjs_agend.vva_heure_debut_exten);
      } else {
        //that.jQuery("#"+that.optio.vva_id_regn).fullCalendar({minTime: that.optio.vjs_formt.vjs_agend.vva_heure_debut});
      }
    }; //END _detrm_heure_debut

    function _detrm_heure_fin() {
    }; //END _detrm_heure_fin

    function _afich_aide_insta(event, jsEvent, view) {
      if(!that.vbo_stat_deplc) {
        if(event.aide_insta != "" && event.aide_insta != "undefined") {
          that.jQuery(jsEvent.currentTarget).attr("title", event.titre_aide_insta + "|" + event.aide_insta).cluetip({
            "cursor" : "pointer",
            "positionBy" : "auto",
            "hideLocal" : false,
            "clickThrough" : false,
            "showTitle" : true,
            "splitTitle" : "|",
            fx : {
              open : 'fadeIn',
              openSpeed : 'fast'
            },
            onShow : function(ct, c) {
              that.toltp_aide_insta = ct;
            }
          });
        }
      }
    }; //END _afich_aide_insta

    function _fermr_aide_insta(event, jsEvent, view) {
    }; //END _fermr_aide_insta

    function _suprm_toltp_aide_insta() {
      if(that.toltp_aide_insta) {
        that.toltp_aide_insta.remove();
        that.toltp_aide_insta = false;
      }
    }; //END _suprm_toltp_aide_insta

    function _genr_liste_evenm_agend(pjs_liste_evenm) {
      var var_liste_evenm_agend = [];

      for(var i = 0, vnu_nombr_evenm = pjs_liste_evenm.row.length; i < vnu_nombr_evenm; i++) {
        var_liste_evenm_agend.push({
          id : pjs_liste_evenm.row[i].agend + ':' + pjs_liste_evenm.row[i].ident,
          ident : pjs_liste_evenm.row[i].ident,
          title : pjs_liste_evenm.row[i].titre,
          descr : pjs_liste_evenm.row[i].descr,
          allDay : pjs_liste_evenm.row[i].indic_journ_compl,
          start : (pjs_liste_evenm.row[i].indic_journ_compl) ? that.jQuery.fullCalendar.parseDate(pjs_liste_evenm.row[i].date_journ_compl) : that.jQuery.fullCalendar.parseDate(pjs_liste_evenm.row[i].date_debut),
          end : (pjs_liste_evenm.row[i].indic_journ_compl) ? that.jQuery.fullCalendar.parseDate(pjs_liste_evenm.row[i].date_fin_journ_compl) : that.jQuery.fullCalendar.parseDate(pjs_liste_evenm.row[i].date_fin),
          //url:        pjs_evenm.row[i].lien,
          className : pjs_liste_evenm.row[i].clas_css,
          editable : pjs_liste_evenm.row[i].indic_modfb,
          titre_aide_insta : pjs_liste_evenm.row[i].titre_aide_insta,
          aide_insta : pjs_liste_evenm.row[i].aide_insta,
          agend : pjs_liste_evenm.row[i].agend
        });
      }

      return var_liste_evenm_agend;
    }; //END _genr_liste_evenm_agend

    function _ajout_agend(pva_agend) {
      //TODO::CARLO, gestion de className
      that.var_evenm_sourc["agend_" + pva_agend] = {
        events : function(start, end, callback) {
          that.jQuery.exec_aplic_procs({
            plugn_ajax : that.optio.vva_plugn_ajax,
            widget_action : "OBTEN_JSON_EVENM_AGEND",
            x01 : start.getTime(),
            x02 : end.getTime(),
            x03 : pva_agend,
            sucs_procs : function(pjs_liste_evenm) {
              var var_liste_evenm_agend = [];
              var_liste_evenm_agend = that._genr_liste_evenm_agend(pjs_liste_evenm);
              //appliquer les événements du nouvel agenda
              callback(var_liste_evenm_agend);
            }
          });
        }
      };

      //that.jQuery("#" + that.id).fullCalendar("addEventSource", that.var_evenm_sourc["agend_" + pva_agend]);

      that.obten_calnd().addEventSource(that.var_evenm_sourc["agend_" + pva_agend]);

    }; //END _ajout_agend

    function _suprm_agend(pva_agend) {
      that.obten_calnd().removeEventSource(that.var_evenm_sourc["agend_" + pva_agend]);
      delete that.var_evenm_sourc["agend_" + pva_agend];
    }; //END _suprm_agend

    function afich_liste_agend(pva_liste_agend) {
      var_liste_agend_exist = [];
      var_liste_nouv_agend = [];

      that.jQuery("#" + pva_liste_agend + " input:checked").each(function(i) {
        var_liste_nouv_agend.push(that.jQuery(this).val());
      });
      for( i = 0; vnu_nombr_agend = that.optio.var_liste_agend.length, i < vnu_nombr_agend; i++) {
        vnu_postn = -1;
        if(( vnu_postn = that.jQuery.inArray(that.optio.var_liste_agend[i], var_liste_nouv_agend)) == -1) {
          that._suprm_agend(that.optio.var_liste_agend[i]);
        } else {
          var_liste_agend_exist.push(var_liste_nouv_agend[vnu_postn]);
          var_liste_nouv_agend.splice(vnu_postn, 1);
        }
      }

      for( i = 0; vnu_nombr_agend = var_liste_nouv_agend.length, i < vnu_nombr_agend; i++) {
        that._ajout_agend(var_liste_nouv_agend[i]);
      }

      that.optio.var_liste_agend = that.jQuery.merge(var_liste_agend_exist, var_liste_nouv_agend);
    }; //END afich_liste_agend

    //return that;
  } //END calnd
}