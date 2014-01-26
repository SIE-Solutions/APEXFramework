/**
 * @namespace afw.sie_21.regn.telvr_fichr
 */
afw.sie_21.regn.telvr_fichr = {
    insta: [],
    obten: function(pnu_id) {
        for (i=0; i<afw.sie_21.regn.telvr_fichr.insta.length; i++) {
            if (afw.sie_21.regn.telvr_fichr.insta[i].id == pnu_id) {
                return afw.sie_21.regn.telvr_fichr.insta[i];
            }
        }
    },
    suprm: function(pnu_id) {
        for (i=0; i<afw.sie_21.regn.telvr_fichr.insta.length; i++) {
            if (afw.sie_21.regn.telvr_fichr.insta[i].id == pnu_id) {
                afw.sie_21.regn.telvr_fichr.insta.splice(i,1);
            }
        }
    },
    /**
     * @constructor
     */
    telvr_fichr : function (pjs_optio, pjs_calbc) {
        this.jQuery                     = afw.jQuery;
        var that                        = this;
        this.node                       = false;
        this.id                         = false;
        this.vnu_seqnc_fichr            = 0;
        this.vnu_tail_maxml             = 10;
        this.var_liste_fichr            = {"liste_fichr":[]};
        this.initl                      = initl;
        this._defnr_outpt               = _defnr_outpt;
        this._defnr_liste_fichr_a_telvr = _defnr_liste_fichr_a_telvr;
        this._selct_termn               = _selct_termn;
        this._selct                     = _selct;
        this._depsr                     = _depsr;
        this._glisr_par_des             = _glisr_par_des;

        this.optio = {
            vva_id_regn:        "",
            vva_plugn_ajax:     ""
        };

        this.initl(pjs_optio);

        return that;

        function initl(pjs_optio) {
            //fusionner les options passées en paramètre et leurs valeurs par défaut
            that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

            try {
                switch(typeof(that.optio.vva_id_regn)) {
                    case 'string':
                        that.node = document.getElementById(that.optio.vva_id_regn);
                        break;
                    default:
                        that.node = false;
                        break;
                }
            } catch(e) {
                that.node = false;
            }

            // only proceed if that.node are not false
            if(that.node){
                that.id = that.node.id;

                if (!(window.File && window.FileReader && window.FileList && window.Blob)) {
                    that.jQuery("#"+that.id).hide();
                    that.jQuery("#"+that.id).after('<div class="navgt_obsol">Votre navigateur est obsolète. Veuillez mettre à jour votre navigateur.<div>');
                }

                that.jQuery("input","#"+that.id)
                    .change(that._selct);


                var dropZone = that.jQuery('.drop_zone',"#"+that.id).get(0);
                dropZone.addEventListener('dragover', that._glisr_par_des, false);
                dropZone.addEventListener('drop', that._depsr, false);
            } //end if (that.node)
        }; //END initl

        function _defnr_outpt (p_liste_fichr) {
            var var_liste_fichr = [];

            that.jQuery(p_liste_fichr.liste_fichr).each(function(i, fichr){
                if (fichr.indic_a_telvr ) {
                    var vnu_tail_fichr = fichr.fichr.size/1024/1024;

                    var_liste_fichr.push(
                        '<li><div id="fichr_'+fichr.seqnc+'"><div><strong>',
                        fichr.fichr.name,
                        '</strong> (',
                        fichr.fichr.type || 'n/d', ') - ',
                        vnu_tail_fichr.toFixed(2),
                        ' Mo, dernière modification: ',
                        fichr.fichr.lastModifiedDate ? fichr.fichr.lastModifiedDate.toLocaleDateString() : 'n/d</div>',
                        '<div><progress class="barre_progr" max="100" value="0"><span class="percent">0</span>%</progress></div>',
                        '</div>',
                        '</li>');
                }
            });

            that.jQuery('output ul',"#"+that.id).append(var_liste_fichr.join(''));
        }; //END _defnr_outpt

        function _selct_termn() {
            apex.event.trigger(that.jQuery(document), "selct_termn_regn." + that.optio.vva_nom_plugn);
        }; //END _selct_termn

        function _defnr_liste_fichr_a_telvr (p_liste_fichr) {
            for (var i = 0, f; f = p_liste_fichr[i]; i++) {

                var vnu_tail_fichr = f.size/1024/1024;

                if (vnu_tail_fichr <= that.vnu_tail_maxml) {
                    that.vnu_seqnc_fichr++;
                    that.var_liste_fichr.liste_fichr.push({"seqnc":that.vnu_seqnc_fichr,"indic_a_telvr":true,"fichr":f})
                }
                else {
                    alert("Impossible de téléverser le fichier " + f.name + " car sa taille (" + vnu_tail_fichr.toFixed(2) + " Mo) excède la limite de " + that.vnu_tail_maxml + " Mo.");
                }
            }
        }; //END _defnr_liste_fichr_a_telvr

        function _selct(evenm) {
            _defnr_liste_fichr_a_telvr(evenm.target.files);
            _defnr_outpt(that.var_liste_fichr);
            _selct_termn();
        }; //END _selct

        function _depsr(evenm) {
            evenm.stopPropagation();
            evenm.preventDefault();

            _defnr_liste_fichr_a_telvr(evenm.dataTransfer.files);
            _defnr_outpt(that.var_liste_fichr);
            _selct_termn();
        }; //END _depsr

        function _glisr_par_des(evenm) {
            evenm.stopPropagation();
            evenm.preventDefault();

            evenm.dataTransfer.dropEffect = 'copy'; // Explicitly show this is a copy.
        }; //END _glisr_par_des

        return that;

    } //END telvr_fichr
}