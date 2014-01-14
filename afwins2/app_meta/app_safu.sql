set define off
set serveroutput on
set feedback off

alter session set current_schema = afw_040215;


begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - Initialisation - Application - SAFU');
  sie$migrt$pkg.var_aplic(192) := sie_11_aplic_pkg.maj_aplic ('SAFU','SIE APEX Framework - Utilisateur',1000005, sie$migrt$pkg.vnu_seqnc_prodt);

  sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(192),'O');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - Initialisation - Application - SAFU');
end;
/


--Debut - sie_11_versn
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_11_versn');
delete from tc$11$versn;

--Fin - sie_11_versn
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_11_versn');
end;
/

--Debut - sie_13_page
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page');
delete from tc$13$page;

insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page commune', 0, null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 17350);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Accueil', 1, null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 17351);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mes recherches', 6, null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 17352);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mes impressions', 50, null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 17353);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un travail d''impression', 51, null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 17354);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page de connexion', 101, null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 17355);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'O', 'O', 'N', 'N', 'N', 'N', 'N', 'Commentaire', 102, null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 17356);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un utilisateur', 12020, 'ASD', sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 17357);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Historique des accès', 12021, null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 17358);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Gérer le mot de passe', 12030, null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 17359);

merge into sie_13_page t
                        using tc$13$page tf
               on ((t.numr_apex = tf.numr_apex) and (t.ref_aplic = tf.ref_aplic or (t.ref_aplic is null and tf.ref_aplic is null) or tf.ref_aplic is null ))
when not matched then
              insert (t.date_dernr_maj_refrn_apex, t.descr, t.dnr_ref_aplic, t.indic_prise_charg_sie01, t.indic_prise_charg_sie04, t.indic_prise_charg_sie13_confr, t.indic_prise_charg_sie13_navgt, t.indic_prise_charg_sie14_popup, t.indic_prise_charg_sie18, t.indic_prise_charg_sie19, t.nom, t.numr_apex, t.prefx_mesg, t.ref_aplic)
              values (tf.date_dernr_maj_refrn_apex, tf.descr, tf.dnr_ref_aplic, tf.indic_prise_charg_sie01, tf.indic_prise_charg_sie04, tf.indic_prise_charg_sie13_confr, tf.indic_prise_charg_sie13_navgt, tf.indic_prise_charg_sie14_popup, tf.indic_prise_charg_sie18, tf.indic_prise_charg_sie19, tf.nom, tf.numr_apex, tf.prefx_mesg, tf.ref_aplic)
when matched then
              update set t.date_dernr_maj_refrn_apex = tf.date_dernr_maj_refrn_apex, t.descr = tf.descr, t.dnr_ref_aplic = tf.dnr_ref_aplic, t.indic_prise_charg_sie01 = tf.indic_prise_charg_sie01, t.indic_prise_charg_sie04 = tf.indic_prise_charg_sie04, t.indic_prise_charg_sie13_confr = tf.indic_prise_charg_sie13_confr, t.indic_prise_charg_sie13_navgt = tf.indic_prise_charg_sie13_navgt, t.indic_prise_charg_sie14_popup = tf.indic_prise_charg_sie14_popup, t.indic_prise_charg_sie18 = tf.indic_prise_charg_sie18, t.indic_prise_charg_sie19 = tf.indic_prise_charg_sie19, t.nom = tf.nom, t.prefx_mesg = tf.prefx_mesg
log errors into em$13_page
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_page');
  end if;
end;

select seqnc into sie$migrt$pkg.var_page(17350) from sie_13_page where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
select seqnc into sie$migrt$pkg.var_page(17351) from sie_13_page where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
select seqnc into sie$migrt$pkg.var_page(17352) from sie_13_page where numr_apex = 6 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
select seqnc into sie$migrt$pkg.var_page(17353) from sie_13_page where numr_apex = 50 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
select seqnc into sie$migrt$pkg.var_page(17354) from sie_13_page where numr_apex = 51 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
select seqnc into sie$migrt$pkg.var_page(17355) from sie_13_page where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
select seqnc into sie$migrt$pkg.var_page(17356) from sie_13_page where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
select seqnc into sie$migrt$pkg.var_page(17357) from sie_13_page where numr_apex = 12020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
select seqnc into sie$migrt$pkg.var_page(17358) from sie_13_page where numr_apex = 12021 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
select seqnc into sie$migrt$pkg.var_page(17359) from sie_13_page where numr_apex = 12030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
--Fin - sie_13_page
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page');
end;
/

--Debut - sie_13_page_lang
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_lang');
delete from tc$13$page$lang;

insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'Page commune', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17350, 'Insert'), 14035);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'Accueil', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17351, 'Insert'), 14036);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'Mes recherches', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17352, 'Insert'), 14037);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'Mes impressions', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17353, 'Insert'), 14038);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'Travail d''impression', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17354, 'Insert'), 14039);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'Page de connexion', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17355, 'Insert'), 14040);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'Feedback', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17356, 'Insert'), 14041);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'Mettre à jour', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17357, 'Insert'), 14042);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'Historique des accès', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17358, 'Insert'), 14043);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'Gérer le mot de passe', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17359, 'Insert'), 14044);

merge into sie_13_page_lang t
                        using tc$13$page$lang tf
               on ((t.ref_lang = tf.ref_lang or (t.ref_lang is null and tf.ref_lang is null) or tf.ref_lang is null ) and (t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ))
when not matched then
              insert (t.dnr_ref_aplic, t.nom, t.ref_lang, t.ref_page)
              values (tf.dnr_ref_aplic, tf.nom, tf.ref_lang, tf.ref_page)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.nom = tf.nom
log errors into em$13_page_lang
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_page_lang');
  end if;
end;

select seqnc into sie$migrt$pkg.var_page_lang(14035) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14036) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17351, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14037) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14038) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17353, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14039) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17354, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14040) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17355, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14041) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14042) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14043) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17358, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14044) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
--Fin - sie_13_page_lang
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_lang');
end;
/

--Debut - sie_13_page_ir
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_ir');
delete from tc$13$page$ir;

insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'N', null, 'Historique des accès', 1, sie$migrt$pkg.obten_var_page(17358, 'Insert'), 7123, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'N', null, 'Résultat des recherches', 1, sie$migrt$pkg.obten_var_page(17352, 'Insert'), 7125, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 'N', null, 'Liste des travaux d''impression', 1, sie$migrt$pkg.obten_var_page(17353, 'Insert'), 7124, null);
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_ir');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_ir');

merge into sie_13_page_ir t
                        using tc$13$page$ir tf
               on ((t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ))
when not matched then
              insert (t.dnr_ref_aplic, t.indic_forcr_ajust_page, t.largr_deft, t.libl_regn, t.nombr_page_largr, t.ref_page, t.unite_mesr_largr_deft)
              values (tf.dnr_ref_aplic, tf.indic_forcr_ajust_page, tf.largr_deft, tf.libl_regn, tf.nombr_page_largr, tf.ref_page, tf.unite_mesr_largr_deft)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.indic_forcr_ajust_page = tf.indic_forcr_ajust_page, t.largr_deft = tf.largr_deft, t.libl_regn = tf.libl_regn, t.nombr_page_largr = tf.nombr_page_largr, t.unite_mesr_largr_deft = tf.unite_mesr_largr_deft
log errors into em$13_page_ir
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_page_ir');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_ir');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_ir');
select seqnc into sie$migrt$pkg.var_page_ir(7123) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17358, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7125) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7124) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17353, 'Select');
--Fin - sie_13_page_ir
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_ir');
end;
/

--Debut - sie_13_page_ir_coln
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_ir_coln');
delete from tc$13$page$ir$coln;

insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 62321941287195991, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7124, 'Insert'), 58658, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_IMEDT_FORMT', sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 62322045146195992, 'O', null, 'Exécution<br />immediate', 2, sie$migrt$pkg.obten_var_page_ir(7124, 'Insert'), 58659, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 62322149066195992, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7124, 'Insert'), 58660, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STAT_FORMT', sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 62322250071195992, 'O', null, 'Statut', 4, sie$migrt$pkg.obten_var_page_ir(7124, 'Insert'), 58661, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOMBR_ELEMN', sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 62322351996195992, 'O', null, 'Nombre<br />éléments', 5, sie$migrt$pkg.obten_var_page_ir(7124, 'Insert'), 58662, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_CREAT', sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 62322442504195993, 'O', null, 'Créé le', 6, sie$migrt$pkg.obten_var_page_ir(7124, 'Insert'), 58663, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('LIEN', sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 62322536906195993, 'O', null, 'Impression', 8, sie$migrt$pkg.obten_var_page_ir(7124, 'Insert'), 58664, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_TYPE_EVENM_FORMT', sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 56727058368649612, 'O', null, 'Événement', 2, sie$migrt$pkg.obten_var_page_ir(7123, 'Insert'), 58665, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_EVENM', sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 56729755031688987, 'O', null, 'Date', 1, sie$migrt$pkg.obten_var_page_ir(7123, 'Insert'), 58666, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DNR_LIBL_STRUC_APLIC_HTML', sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 425709925049554162, 'O', null, 'Énoncé trouvé', 4, sie$migrt$pkg.obten_var_page_ir(7125, 'Insert'), 58667, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DNR_PERTN', sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 425710046159554162, 'O', null, 'Pertinence (%)', 5, sie$migrt$pkg.obten_var_page_ir(7125, 'Insert'), 58668, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DNR_LIEN', sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 425710147507554162, 'O', null, 'Lien', 6, sie$migrt$pkg.obten_var_page_ir(7125, 'Insert'), 58669, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DNR_REF_STRUC_APLIC_FORMT', sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 426131435347448197, 'O', null, 'Résultat', 7, sie$migrt$pkg.obten_var_page_ir(7125, 'Insert'), 58670, null);
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_ir_coln');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_ir_coln');

merge into sie_13_page_ir_coln t
                        using tc$13$page$ir$coln tf
               on ((t.coln_table = tf.coln_table) and (t.ref_page_ir = tf.ref_page_ir or (t.ref_page_ir is null and tf.ref_page_ir is null) or tf.ref_page_ir is null ))
when not matched then
              insert (t.coln_table, t.dnr_ref_aplic, t.id_apex, t.indic_exprt, t.largr, t.libl, t.ordre_afich, t.ref_page_ir, t.type_largr)
              values (tf.coln_table, tf.dnr_ref_aplic, tf.id_apex, tf.indic_exprt, tf.largr, tf.libl, tf.ordre_afich, tf.ref_page_ir, tf.type_largr)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.id_apex = tf.id_apex, t.indic_exprt = tf.indic_exprt, t.largr = tf.largr, t.libl = tf.libl, t.ordre_afich = tf.ordre_afich, t.type_largr = tf.type_largr
log errors into em$13_page_ir_coln
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir_coln;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_page_ir_coln');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_ir_coln');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_ir_coln');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58658) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7124, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58659) from sie_13_page_ir_coln where coln_table = 'INDIC_IMEDT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7124, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58660) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7124, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58661) from sie_13_page_ir_coln where coln_table = 'REF_STAT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7124, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58662) from sie_13_page_ir_coln where coln_table = 'NOMBR_ELEMN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7124, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58663) from sie_13_page_ir_coln where coln_table = 'DATE_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7124, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58664) from sie_13_page_ir_coln where coln_table = 'LIEN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7124, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58665) from sie_13_page_ir_coln where coln_table = 'REF_DV_TYPE_EVENM_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7123, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58666) from sie_13_page_ir_coln where coln_table = 'DATE_EVENM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7123, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58667) from sie_13_page_ir_coln where coln_table = 'DNR_LIBL_STRUC_APLIC_HTML' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7125, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58668) from sie_13_page_ir_coln where coln_table = 'DNR_PERTN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7125, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58669) from sie_13_page_ir_coln where coln_table = 'DNR_LIEN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7125, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58670) from sie_13_page_ir_coln where coln_table = 'DNR_REF_STRUC_APLIC_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7125, 'Select');
--Fin - sie_13_page_ir_coln
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_ir_coln');
end;
/

--Debut - sie_13_page_prefr_navgt
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_prefr_navgt');
delete from tc$13$page$prefr$navgt;

--Fin - sie_13_page_prefr_navgt
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_prefr_navgt');
end;
/

--Debut - sie_13_liste_navgt
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_liste_navgt');
delete from tc$13$liste$navgt;

--Fin - sie_13_liste_navgt
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_liste_navgt');
end;
/

--Debut - sie_13_page_item
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_item');
delete from tc$13$page$item;

insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 18958572122713254, 'O', null, null, null, null, 'N', null, '[SADA]', 'SADA', sie$migrt$pkg.obten_var_page(17350, 'Insert'), 219972, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 48503571405794162, 'O', null, null, null, null, 'N', null, 'Test', 'SIDF', sie$migrt$pkg.obten_var_page(17350, 'Insert'), 219973, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 48503798879794164, 'O', null, null, null, null, 'N', null, '[SSPC]', 'SSPC', sie$migrt$pkg.obten_var_page(17350, 'Insert'), 219974, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 48503973869794164, 'O', null, null, null, null, 'N', null, '[SCPC]', 'SCPC', sie$migrt$pkg.obten_var_page(17350, 'Insert'), 219975, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 48842792291413645, 'O', null, null, null, null, 'N', null, '[SAPC]', 'SAPC', sie$migrt$pkg.obten_var_page(17350, 'Insert'), 219976, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 70327276282470309, 'O', null, null, null, null, 'N', null, 'SNPI', 'SNPI', sie$migrt$pkg.obten_var_page(17350, 'Insert'), 219977, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 93067592679637942, 'O', null, null, null, null, 'N', null, '[SCPI]', 'SCPI', sie$migrt$pkg.obten_var_page(17350, 'Insert'), 219978, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 93067797874639465, 'O', null, null, null, null, 'N', null, '[SSPI]', 'SSPI', sie$migrt$pkg.obten_var_page(17350, 'Insert'), 219979, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 93068002722640812, 'O', null, null, null, null, 'N', null, '[SAPI]', 'SAPI', sie$migrt$pkg.obten_var_page(17350, 'Insert'), 219980, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 240761543786188990, 'O', null, null, null, null, 'N', null, '[P0_FILTR_RECHR]', 'P0_FILTR_RECHR', sie$migrt$pkg.obten_var_page(17350, 'Insert'), 219981, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 10650446236443048, 'O', null, null, null, null, 'N', null, '[P1_SEQNC]', 'P1_SEQNC', sie$migrt$pkg.obten_var_page(17351, 'Insert'), 219982, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 424933332676784604, 'O', null, null, null, null, 'N', null, 'Recherches antérieures', 'P6_RECHR', sie$migrt$pkg.obten_var_page(17352, 'Insert'), 219983, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 424934327229839756, 'O', null, null, null, null, 'N', null, 'Éléments trouvés', 'P6_RESLT_RECHR', sie$migrt$pkg.obten_var_page(17352, 'Insert'), 219984, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 426135352868718192, 'O', null, null, null, null, 'N', null, 'Énoncé', 'P6_NOUV_RECHR', sie$migrt$pkg.obten_var_page(17352, 'Insert'), 219985, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 426186735648946926, 'O', null, null, null, null, 'N', null, 'selon', 'P6_EXECT_NOUV', sie$migrt$pkg.obten_var_page(17352, 'Insert'), 219986, 'ITEM');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_13_page_item');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 426264047360047202, 'O', null, null, null, null, 'N', null, 'dans', 'P6_SYSTM', sie$migrt$pkg.obten_var_page(17352, 'Insert'), 219988, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 426265526544088508, 'O', null, null, null, null, 'N', null, 'Exécuter', 'P6_EXECT', sie$migrt$pkg.obten_var_page(17352, 'Insert'), 219989, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 426533154054388001, 'O', null, null, null, null, 'N', null, '[P6_MODL_RECHR]', 'P6_MODL_RECHR', sie$migrt$pkg.obten_var_page(17352, 'Insert'), 219990, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 69559443598943278, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P51_SEQNC', sie$migrt$pkg.obten_var_page(17354, 'Insert'), 219992, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 69559632791943285, 'O', null, null, null, null, 'O', null, 'Nom', 'P51_NOM', sie$migrt$pkg.obten_var_page(17354, 'Insert'), 219993, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 65992109604638097, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17354, 'Insert'), 219994, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 65991717871638094, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17354, 'Insert'), 219995, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 65991905311638097, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17354, 'Insert'), 219996, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 65992317951638097, 'N', null, null, null, null, 'N', null, 'Imprimer lot ', 'IMPR_TRAVL', sie$migrt$pkg.obten_var_page(17354, 'Insert'), 219997, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 65992511948638097, 'N', null, null, null, null, 'N', null, 'Ajout à la file d''impression', 'AJOUT_IMPRE', sie$migrt$pkg.obten_var_page(17354, 'Insert'), 219998, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 19351539174260232, 'O', null, null, null, null, 'N', null, 'Code d''utilisateur', 'P101_CODE_UTILS', sie$migrt$pkg.obten_var_page(17355, 'Insert'), 219999, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 19351752475260233, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P101_MOT_PASSE', sie$migrt$pkg.obten_var_page(17355, 'Insert'), 220000, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 19351931953260234, 'O', null, null, null, null, 'N', null, 'Connexion', 'P101_LOGIN', sie$migrt$pkg.obten_var_page(17355, 'Insert'), 220001, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 19352131529260234, 'O', null, null, null, null, 'N', null, 'Domaine', 'P101_DOMN', sie$migrt$pkg.obten_var_page(17355, 'Insert'), 220002, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 19352347898260235, 'O', null, null, null, null, 'N', null, '[P101_LANG]', 'P101_LANG', sie$migrt$pkg.obten_var_page(17355, 'Insert'), 220003, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 19352557107260235, 'O', null, null, null, null, 'N', null, '[P101_FORCE_DOMN]', 'P101_FORCE_DOMN', sie$migrt$pkg.obten_var_page(17355, 'Insert'), 220004, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 422502724813505743, 'O', null, null, null, null, 'N', null, 'Application:', 'P102_APPLICATION_ID', sie$migrt$pkg.obten_var_page(17356, 'Insert'), 220005, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 422503225033505743, 'O', null, null, null, null, 'N', null, 'Page:', 'P102_PAGE_ID', sie$migrt$pkg.obten_var_page(17356, 'Insert'), 220006, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 422503755475505744, 'O', null, null, null, null, 'N', null, '[P102_A]', 'P102_A', sie$migrt$pkg.obten_var_page(17356, 'Insert'), 220007, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 422503933471505744, 'O', null, null, null, null, 'N', null, 'Commentaire', 'P102_FEEDBACK', sie$migrt$pkg.obten_var_page(17356, 'Insert'), 220008, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 422504456938505744, 'O', null, null, null, null, 'N', null, '[P102_X]', 'P102_X', sie$migrt$pkg.obten_var_page(17356, 'Insert'), 220009, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 422504656038505744, 'O', null, null, null, null, 'N', null, 'Type de commentaire', 'P102_FEEDBACK_TYPE', sie$migrt$pkg.obten_var_page(17356, 'Insert'), 220010, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 422505156529505745, 'O', null, null, null, null, 'N', null, '[P102_Y]', 'P102_Y', sie$migrt$pkg.obten_var_page(17356, 'Insert'), 220011, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 418936022503200563, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SUBMIT', sie$migrt$pkg.obten_var_page(17356, 'Insert'), 220012, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 16529060130659922, 'O', null, null, null, null, 'O', null, 'Courriel', 'P12020_COURL', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220013, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 48535994038906986, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12020_SEQNC', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220014, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 48536203260906987, 'O', null, null, null, null, 'O', null, 'Nom', 'P12020_NOM', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220015, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 48536378573906989, 'O', null, null, null, null, 'O', null, 'Prénom', 'P12020_PRENM', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220016, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 48536778802906989, 'O', null, null, null, null, 'O', null, 'Code', 'P12020_CODE_UTILS', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220017, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 48537384999906992, 'O', null, null, null, null, 'O', null, 'Date expiration', 'P12020_DATE_EXPIR', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220018, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 48537599923906992, 'O', null, null, null, null, 'O', null, 'Compte verrouillé', 'P12020_INDIC_VERL', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220019, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 48537974893906992, 'O', null, null, null, null, 'O', null, 'Changer mot passe<br />prochaine connexion', 'P12020_INDIC_CHANG_MOT_PASSE', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220020, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 49188590836819389, 'O', null, null, null, null, 'N', null, 'Gérer mot de passe', 'P12020_MOT_PASSE', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220021, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 51689682262496103, 'O', null, null, null, null, 'N', null, '[P12020_GROUP_UTILS]', 'P12020_GROUP_UTILS', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220022, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 70532066828205690, 'O', null, null, null, null, 'N', null, 'Filtrer par application', 'P12020_FILTR_APLIC', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220023, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 70532448961285715, 'O', null, null, null, null, 'N', null, 'Filtre par mot clé', 'P12020_FILTR_MOT_CLE', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220024, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 70533057497354390, 'O', null, null, null, null, 'N', null, 'Appliquer filtre', 'P12020_APLIQ_FILTR', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220025, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 44968556150601804, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220026, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 44968877424601805, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220027, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 44968459265601804, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220028, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 44974053944611671, 'N', null, null, null, null, 'N', null, 'Créer et ajouter', 'CREATE_ADD', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220029, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 44968647615601804, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17357, 'Insert'), 220030, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 49273473934805653, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12030_SEQNC', sie$migrt$pkg.obten_var_page(17359, 'Insert'), 220031, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 49273699942805654, 'O', null, null, null, null, 'O', null, 'Nom', 'P12030_NOM', sie$migrt$pkg.obten_var_page(17359, 'Insert'), 220032, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 49273892229805656, 'O', null, null, null, null, 'O', null, 'Prénom', 'P12030_PRENM', sie$migrt$pkg.obten_var_page(17359, 'Insert'), 220033, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 49274087024805656, 'O', null, null, null, null, 'O', null, 'Code utilisateur', 'P12030_CODE_UTILS', sie$migrt$pkg.obten_var_page(17359, 'Insert'), 220034, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 49278081752830267, 'O', null, null, null, null, 'N', null, 'Ancien mot de passe', 'P12030_ANCN_MOT_PASSE', sie$migrt$pkg.obten_var_page(17359, 'Insert'), 220035, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 49278291426830267, 'O', null, null, null, null, 'N', null, 'Nouveau mot de passe', 'P12030_NOUV_MOT_PASSE_1', sie$migrt$pkg.obten_var_page(17359, 'Insert'), 220036, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 49278479582830269, 'O', null, null, null, null, 'N', null, 'Confirmer le nouveau mot de passe', 'P12030_CONFR_MOT_PASSE', sie$migrt$pkg.obten_var_page(17359, 'Insert'), 220037, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 49280090194842195, 'O', null, null, null, null, 'N', null, 'Annuler', 'P12030_ANULR', sie$migrt$pkg.obten_var_page(17359, 'Insert'), 220038, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 49280298530842195, 'O', null, null, null, null, 'N', null, 'Définir le mot de passe', 'P12030_DEFNR_MOT_PASSE', sie$migrt$pkg.obten_var_page(17359, 'Insert'), 220039, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 49281678204848220, 'O', null, null, null, null, 'N', null, '[P12030_7_0]', 'P12030_7_0', sie$migrt$pkg.obten_var_page(17359, 'Insert'), 220040, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 453298631612908675, 'N', null, null, null, null, 'N', null, 'Nouvelle recherche', 'AUTRE_RECHR', sie$migrt$pkg.obten_var_page(17352, 'Insert'), 229565, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(192, 'Insert'), 427530446591891613, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17352, 'Insert'), 229566, 'BOUTN');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_item');

merge into sie_13_page_item t
                        using tc$13$page$item tf
               on ((t.nom_apex = tf.nom_apex) and (t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ))
when not matched then
              insert (t.depsm_alias_coln, t.dnr_ref_aplic, t.id_apex, t.indic_confr_sauvg, t.indic_creat, t.indic_en_creat, t.indic_en_modfc, t.indic_modfc, t.indic_rechr, t.indic_suprs, t.libl, t.nom_apex, t.ref_page, t.type_item)
              values (tf.depsm_alias_coln, tf.dnr_ref_aplic, tf.id_apex, tf.indic_confr_sauvg, tf.indic_creat, tf.indic_en_creat, tf.indic_en_modfc, tf.indic_modfc, tf.indic_rechr, tf.indic_suprs, tf.libl, tf.nom_apex, tf.ref_page, tf.type_item)
when matched then
              update set t.depsm_alias_coln = tf.depsm_alias_coln, t.dnr_ref_aplic = tf.dnr_ref_aplic, t.id_apex = tf.id_apex, t.indic_confr_sauvg = tf.indic_confr_sauvg, t.indic_creat = tf.indic_creat, t.indic_en_creat = tf.indic_en_creat, t.indic_en_modfc = tf.indic_en_modfc, t.indic_modfc = tf.indic_modfc, t.indic_rechr = tf.indic_rechr, t.indic_suprs = tf.indic_suprs, t.libl = tf.libl, t.type_item = tf.type_item
log errors into em$13_page_item
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_item;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_page_item');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_item');
select seqnc into sie$migrt$pkg.var_page_item(219972) from sie_13_page_item where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219973) from sie_13_page_item where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219974) from sie_13_page_item where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219975) from sie_13_page_item where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219976) from sie_13_page_item where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219977) from sie_13_page_item where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219978) from sie_13_page_item where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219979) from sie_13_page_item where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219980) from sie_13_page_item where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219981) from sie_13_page_item where nom_apex = 'P0_FILTR_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219982) from sie_13_page_item where nom_apex = 'P1_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17351, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219983) from sie_13_page_item where nom_apex = 'P6_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219984) from sie_13_page_item where nom_apex = 'P6_RESLT_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219985) from sie_13_page_item where nom_apex = 'P6_NOUV_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219986) from sie_13_page_item where nom_apex = 'P6_EXECT_NOUV' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_13_page_item');
select seqnc into sie$migrt$pkg.var_page_item(219988) from sie_13_page_item where nom_apex = 'P6_SYSTM' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219989) from sie_13_page_item where nom_apex = 'P6_EXECT' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219990) from sie_13_page_item where nom_apex = 'P6_MODL_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219992) from sie_13_page_item where nom_apex = 'P51_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17354, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219993) from sie_13_page_item where nom_apex = 'P51_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17354, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219994) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17354, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219995) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17354, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219996) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17354, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219997) from sie_13_page_item where nom_apex = 'IMPR_TRAVL' and ref_page = sie$migrt$pkg.obten_var_page(17354, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219998) from sie_13_page_item where nom_apex = 'AJOUT_IMPRE' and ref_page = sie$migrt$pkg.obten_var_page(17354, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(219999) from sie_13_page_item where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17355, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220000) from sie_13_page_item where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17355, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220001) from sie_13_page_item where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(17355, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220002) from sie_13_page_item where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17355, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220003) from sie_13_page_item where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(17355, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220004) from sie_13_page_item where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17355, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220005) from sie_13_page_item where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220006) from sie_13_page_item where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220007) from sie_13_page_item where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220008) from sie_13_page_item where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220009) from sie_13_page_item where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220010) from sie_13_page_item where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220011) from sie_13_page_item where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220012) from sie_13_page_item where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220013) from sie_13_page_item where nom_apex = 'P12020_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220014) from sie_13_page_item where nom_apex = 'P12020_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220015) from sie_13_page_item where nom_apex = 'P12020_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220016) from sie_13_page_item where nom_apex = 'P12020_PRENM' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220017) from sie_13_page_item where nom_apex = 'P12020_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220018) from sie_13_page_item where nom_apex = 'P12020_DATE_EXPIR' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220019) from sie_13_page_item where nom_apex = 'P12020_INDIC_VERL' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220020) from sie_13_page_item where nom_apex = 'P12020_INDIC_CHANG_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220021) from sie_13_page_item where nom_apex = 'P12020_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220022) from sie_13_page_item where nom_apex = 'P12020_GROUP_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220023) from sie_13_page_item where nom_apex = 'P12020_FILTR_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220024) from sie_13_page_item where nom_apex = 'P12020_FILTR_MOT_CLE' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220025) from sie_13_page_item where nom_apex = 'P12020_APLIQ_FILTR' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220026) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220027) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220028) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220029) from sie_13_page_item where nom_apex = 'CREATE_ADD' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220030) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220031) from sie_13_page_item where nom_apex = 'P12030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220032) from sie_13_page_item where nom_apex = 'P12030_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220033) from sie_13_page_item where nom_apex = 'P12030_PRENM' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220034) from sie_13_page_item where nom_apex = 'P12030_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220035) from sie_13_page_item where nom_apex = 'P12030_ANCN_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220036) from sie_13_page_item where nom_apex = 'P12030_NOUV_MOT_PASSE_1' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220037) from sie_13_page_item where nom_apex = 'P12030_CONFR_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220038) from sie_13_page_item where nom_apex = 'P12030_ANULR' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220039) from sie_13_page_item where nom_apex = 'P12030_DEFNR_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(220040) from sie_13_page_item where nom_apex = 'P12030_7_0' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(229565) from sie_13_page_item where nom_apex = 'AUTRE_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(229566) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
--Fin - sie_13_page_item
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_item');
end;
/

--Debut - sie_13_page_item_lang
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_item_lang');
delete from tc$13$page$item$lang;

--Fin - sie_13_page_item_lang
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_item_lang');
end;
/

--Debut - sie_13_condt_piltb
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_condt_piltb');
delete from tc$13$condt$piltb;

--Fin - sie_13_condt_piltb
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_condt_piltb');
end;
/

--Debut - sie_13_lien_condt_piltb
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_lien_condt_piltb');
delete from tc$13$lien$condt$piltb;

--Fin - sie_13_lien_condt_piltb
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_lien_condt_piltb');
end;
/

--Debut - sie_13_regn_piltb
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_regn_piltb');
delete from tc$13$regn$piltb;

--Fin - sie_13_regn_piltb
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_regn_piltb');
end;
/

--Debut - sie_13_regn_piltb_lang
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_regn_piltb_lang');
delete from tc$13$regn$piltb$lang;

--Fin - sie_13_regn_piltb_lang
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_regn_piltb_lang');
end;
/

--Debut - sie_13_prefr
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_prefr');
delete from tc$13$prefr;

--Fin - sie_13_prefr
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_prefr');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$11_versn;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_11_versn');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_versn');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4499, 'Update') where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4567, 'Update') where numr_apex = 6 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3494, 'Update') where numr_apex = 50 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3494, 'Update') where numr_apex = 51 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4574, 'Update') where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4561, 'Update') where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Update') where numr_apex = 12020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4905, 'Update') where numr_apex = 12021 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4904, 'Update') where numr_apex = 12030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(192, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_lang');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_lang');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_ir');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_ir');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7124, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_IMEDT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7124, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7124, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STAT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7124, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOMBR_ELEMN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7124, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7124, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'LIEN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7124, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_TYPE_EVENM_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7123, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_EVENM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7123, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DNR_LIBL_STRUC_APLIC_HTML' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7125, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DNR_PERTN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7125, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DNR_LIEN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7125, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DNR_REF_STRUC_APLIC_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7125, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir_coln;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_ir_coln');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_ir_coln');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_prefr_navgt;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_prefr_navgt');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_prefr_navgt');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_liste_navgt;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_liste_navgt');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_liste_navgt');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P0_FILTR_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17350, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17351, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_RESLT_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_NOUV_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_EXECT_NOUV' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_13_page_item');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_SYSTM' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_EXECT' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_MODL_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P51_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17354, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P51_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17354, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17354, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17354, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17354, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'IMPR_TRAVL' and ref_page = sie$migrt$pkg.obten_var_page(17354, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'AJOUT_IMPRE' and ref_page = sie$migrt$pkg.obten_var_page(17354, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17355, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17355, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(17355, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17355, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(17355, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17355, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(17356, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(49528, 'Update'), ref_opert = null where nom_apex = 'P12020_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(49189, 'Update'), ref_opert = null where nom_apex = 'P12020_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(48987, 'Update'), ref_opert = null where nom_apex = 'P12020_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(49190, 'Update'), ref_opert = null where nom_apex = 'P12020_PRENM' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(49529, 'Update'), ref_opert = null where nom_apex = 'P12020_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(49191, 'Update'), ref_opert = null where nom_apex = 'P12020_DATE_EXPIR' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(48988, 'Update'), ref_opert = null where nom_apex = 'P12020_INDIC_VERL' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(49192, 'Update'), ref_opert = null where nom_apex = 'P12020_INDIC_CHANG_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(49193, 'Update'), ref_opert = null where nom_apex = 'P12020_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(49434, 'Update'), ref_opert = null where nom_apex = 'P12020_GROUP_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(49530, 'Update'), ref_opert = null where nom_apex = 'P12020_FILTR_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(49194, 'Update'), ref_opert = null where nom_apex = 'P12020_FILTR_MOT_CLE' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(49195, 'Update'), ref_opert = null where nom_apex = 'P12020_APLIQ_FILTR' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE_ADD' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17357, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_PRENM' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_ANCN_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_NOUV_MOT_PASSE_1' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_CONFR_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_ANULR' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_DEFNR_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_7_0' and ref_page = sie$migrt$pkg.obten_var_page(17359, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'AUTRE_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17352, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_item;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_item');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_item_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_item_lang');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_item_lang');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_condt_piltb;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_condt_piltb');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_condt_piltb');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_lien_condt_piltb;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_lien_condt_piltb');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_lien_condt_piltb');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_regn_piltb;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_regn_piltb');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_regn_piltb');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_regn_piltb_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_regn_piltb_lang');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_regn_piltb_lang');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_prefr;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_prefr');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_prefr');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_11_aplic
                       set ref_versn = null,
                           indic_aplic_authe = 'N',
                           ref_aplic_authe = sie$migrt$pkg.obten_var_aplic(187, 'Update'),
                           ref_page_conxn = sie$migrt$pkg.obten_var_page(17355, 'Update')
                     where seqnc = sie$migrt$pkg.obten_var_aplic(192);
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_aplic');
end;
/
begin
  if sie$migrt$pkg.vnu_sql_code = 0 then
    dbms_output.put_line ('Mise a jour du referentiel pour application : SAFU - SIE APEX Framework - Utilisateur');
    sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(192),'O');
  end if;
end;
/

