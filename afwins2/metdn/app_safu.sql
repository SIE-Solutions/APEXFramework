--Méta
set define off
set serveroutput on
set feedback off

alter session set current_schema = afw_040200;


begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - Initialisation - Application - SAFU');
  sie$migrt$pkg.var_aplic(12) := sie_11_aplic_pkg.maj_aplic ('SAFU','SIE APEX Framework - Utilisateur',1000005, sie$migrt$pkg.vnu_seqnc_prodt);

  sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(12),'O');
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

insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:20', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mes recherches', 6, null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 11723);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:20', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'O', 'O', 'N', 'N', 'N', 'N', 'N', 'Commentaire', 102, null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 11386);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:20', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page commune', 0, null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 10800);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:20', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Gérer le mot de passe', 12030, null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 10802);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:20', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page de connexion', 101, null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 10803);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:20', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un utilisateur', 12020, 'ASD', sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 10804);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:20', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Accueil', 1, null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 10805);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:20', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Historique des accès', 12021, null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 10807);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:20', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mes impressions', 50, null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 10983);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:20', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un travail d''impression', 51, null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 10984);

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

select seqnc into sie$migrt$pkg.var_page(11723) from sie_13_page where numr_apex = 6 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
select seqnc into sie$migrt$pkg.var_page(11386) from sie_13_page where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
select seqnc into sie$migrt$pkg.var_page(10800) from sie_13_page where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
select seqnc into sie$migrt$pkg.var_page(10802) from sie_13_page where numr_apex = 12030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
select seqnc into sie$migrt$pkg.var_page(10803) from sie_13_page where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
select seqnc into sie$migrt$pkg.var_page(10804) from sie_13_page where numr_apex = 12020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
select seqnc into sie$migrt$pkg.var_page(10805) from sie_13_page where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
select seqnc into sie$migrt$pkg.var_page(10807) from sie_13_page where numr_apex = 12021 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
select seqnc into sie$migrt$pkg.var_page(10983) from sie_13_page where numr_apex = 50 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
select seqnc into sie$migrt$pkg.var_page(10984) from sie_13_page where numr_apex = 51 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
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

insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'Feedback', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11386, 'Insert'), 8727);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'Mes recherches', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11723, 'Insert'), 9064);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'Historique des accès', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10807, 'Insert'), 8121);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'Accueil', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10805, 'Insert'), 8123);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'Mettre à jour', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10804, 'Insert'), 8124);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'Page de connexion', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10803, 'Insert'), 8125);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'Gérer le mot de passe', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10802, 'Insert'), 8126);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'Page commune', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10800, 'Insert'), 8128);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'Travail d''impression', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10984, 'Insert'), 8304);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'Mes impressions', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10983, 'Insert'), 8305);

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

select seqnc into sie$migrt$pkg.var_page_lang(8727) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(9064) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8121) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10807, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8123) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10805, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8124) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8125) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10803, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8126) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8128) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8304) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10984, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8305) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10983, 'Select');
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

insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'N', null, 'Historique des accès', 1, sie$migrt$pkg.obten_var_page(10807, 'Insert'), 4274, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'N', null, 'Liste des travaux d''impression', 1, sie$migrt$pkg.obten_var_page(10983, 'Insert'), 4356, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 'N', null, 'Résultat des recherches', 1, sie$migrt$pkg.obten_var_page(11723, 'Insert'), 4696, null);
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
select seqnc into sie$migrt$pkg.var_page_ir(4274) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10807, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4356) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10983, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4696) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
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

insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 62321941287195991, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4356, 'Insert'), 21853, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_IMEDT_FORMT', sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 62322045146195992, 'O', null, 'Exécution<br />immediate', 2, sie$migrt$pkg.obten_var_page_ir(4356, 'Insert'), 21854, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 62322149066195992, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(4356, 'Insert'), 21855, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STAT_FORMT', sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 62322250071195992, 'O', null, 'Statut', 4, sie$migrt$pkg.obten_var_page_ir(4356, 'Insert'), 21856, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOMBR_ELEMN', sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 62322351996195992, 'O', null, 'Nombre<br />éléments', 5, sie$migrt$pkg.obten_var_page_ir(4356, 'Insert'), 21857, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_CREAT', sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 62322442504195993, 'O', null, 'Créé le', 6, sie$migrt$pkg.obten_var_page_ir(4356, 'Insert'), 21858, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('LIEN', sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 62322536906195993, 'O', null, 'Impression', 8, sie$migrt$pkg.obten_var_page_ir(4356, 'Insert'), 21859, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_TYPE_EVENM_FORMT', sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 56727058368649612, 'O', null, 'Événement', 2, sie$migrt$pkg.obten_var_page_ir(4274, 'Insert'), 21605, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_EVENM', sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 56729755031688987, 'O', null, 'Date', 1, sie$migrt$pkg.obten_var_page_ir(4274, 'Insert'), 21606, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DNR_LIBL_STRUC_APLIC_HTML', sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 425709925049554162, 'O', null, 'Énoncé trouvé', 4, sie$migrt$pkg.obten_var_page_ir(4696, 'Insert'), 22333, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DNR_PERTN', sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 425710046159554162, 'O', null, 'Pertinence (%)', 5, sie$migrt$pkg.obten_var_page_ir(4696, 'Insert'), 22334, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DNR_LIEN', sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 425710147507554162, 'O', null, 'Lien', 6, sie$migrt$pkg.obten_var_page_ir(4696, 'Insert'), 22335, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DNR_REF_STRUC_APLIC_FORMT', sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 426131435347448197, 'O', null, 'Résultat', 7, sie$migrt$pkg.obten_var_page_ir(4696, 'Insert'), 22336, null);
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
select seqnc into sie$migrt$pkg.var_page_ir_coln(21853) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4356, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21854) from sie_13_page_ir_coln where coln_table = 'INDIC_IMEDT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4356, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21855) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4356, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21856) from sie_13_page_ir_coln where coln_table = 'REF_STAT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4356, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21857) from sie_13_page_ir_coln where coln_table = 'NOMBR_ELEMN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4356, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21858) from sie_13_page_ir_coln where coln_table = 'DATE_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4356, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21859) from sie_13_page_ir_coln where coln_table = 'LIEN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4356, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21605) from sie_13_page_ir_coln where coln_table = 'REF_DV_TYPE_EVENM_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4274, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21606) from sie_13_page_ir_coln where coln_table = 'DATE_EVENM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4274, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22333) from sie_13_page_ir_coln where coln_table = 'DNR_LIBL_STRUC_APLIC_HTML' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4696, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22334) from sie_13_page_ir_coln where coln_table = 'DNR_PERTN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4696, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22335) from sie_13_page_ir_coln where coln_table = 'DNR_LIEN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4696, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22336) from sie_13_page_ir_coln where coln_table = 'DNR_REF_STRUC_APLIC_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4696, 'Select');
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

insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 423964121920586434, 'N', null, null, null, null, 'N', null, 'Supprimer', 'P6_SUPRS', sie$migrt$pkg.obten_var_page(11723, 'Insert'), 110070, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 69559443598943278, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P51_SEQNC', sie$migrt$pkg.obten_var_page(10984, 'Insert'), 40633, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 69559632791943285, 'O', null, null, null, null, 'O', null, 'Nom', 'P51_NOM', sie$migrt$pkg.obten_var_page(10984, 'Insert'), 40634, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 44968556150601804, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 109574, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 44968877424601805, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 109575, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 44968459265601804, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 109576, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 44974053944611671, 'N', null, null, null, null, 'N', null, 'Créer et ajouter', 'CREATE_ADD', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 109577, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 44968647615601804, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 109578, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 65991717871638094, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10984, 'Insert'), 109579, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 65991905311638097, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(10984, 'Insert'), 109580, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 65992109604638097, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(10984, 'Insert'), 109581, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 65992317951638097, 'N', null, null, null, null, 'N', null, 'Imprimer lot ', 'IMPR_TRAVL', sie$migrt$pkg.obten_var_page(10984, 'Insert'), 109582, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 65992511948638097, 'N', null, null, null, null, 'N', null, 'Ajout à la file d''impression', 'AJOUT_IMPRE', sie$migrt$pkg.obten_var_page(10984, 'Insert'), 109583, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 418936022503200563, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SUBMIT', sie$migrt$pkg.obten_var_page(11386, 'Insert'), 109584, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 19351539174260232, 'O', null, null, null, null, 'N', null, 'Code d''utilisateur', 'P101_CODE_UTILS', sie$migrt$pkg.obten_var_page(10803, 'Insert'), 36341, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 19351752475260233, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P101_MOT_PASSE', sie$migrt$pkg.obten_var_page(10803, 'Insert'), 36342, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 19351931953260234, 'O', null, null, null, null, 'N', null, 'Connexion', 'P101_LOGIN', sie$migrt$pkg.obten_var_page(10803, 'Insert'), 36343, 'ITEM');
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
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 19352131529260234, 'O', null, null, null, null, 'N', null, 'Domaine', 'P101_DOMN', sie$migrt$pkg.obten_var_page(10803, 'Insert'), 36344, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 19352347898260235, 'O', null, null, null, null, 'N', null, '[P101_LANG]', 'P101_LANG', sie$migrt$pkg.obten_var_page(10803, 'Insert'), 36345, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 19352557107260235, 'O', null, null, null, null, 'N', null, '[P101_FORCE_DOMN]', 'P101_FORCE_DOMN', sie$migrt$pkg.obten_var_page(10803, 'Insert'), 36346, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 16529060130659922, 'O', null, null, null, null, 'O', null, 'Courriel', 'P12020_COURL', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 36347, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 48535994038906986, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12020_SEQNC', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 36348, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 48536203260906987, 'O', null, null, null, null, 'O', null, 'Nom', 'P12020_NOM', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 36349, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 48536378573906989, 'O', null, null, null, null, 'O', null, 'Prénom', 'P12020_PRENM', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 36350, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 48536778802906989, 'O', null, null, null, null, 'O', null, 'Code', 'P12020_CODE_UTILS', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 36351, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 48537384999906992, 'O', null, null, null, null, 'O', null, 'Date expiration', 'P12020_DATE_EXPIR', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 36352, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 48537599923906992, 'O', null, null, null, null, 'O', null, 'Compte verrouillé', 'P12020_INDIC_VERL', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 36353, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 48537974893906992, 'O', null, null, null, null, 'O', null, 'Changer mot passe<br />prochaine connexion', 'P12020_INDIC_CHANG_MOT_PASSE', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 36354, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 49188590836819389, 'O', null, null, null, null, 'N', null, 'Gérer mot de passe', 'P12020_MOT_PASSE', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 36355, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 51689682262496103, 'O', null, null, null, null, 'N', null, '[P12020_GROUP_UTILS]', 'P12020_GROUP_UTILS', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 36356, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 70532066828205690, 'O', null, null, null, null, 'N', null, 'Filtrer par application', 'P12020_FILTR_APLIC', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 36357, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 70532448961285715, 'O', null, null, null, null, 'N', null, 'Filtre par mot clé', 'P12020_FILTR_MOT_CLE', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 36358, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 70533057497354390, 'O', null, null, null, null, 'N', null, 'Appliquer filtre', 'P12020_APLIQ_FILTR', sie$migrt$pkg.obten_var_page(10804, 'Insert'), 36359, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 10650446236443048, 'O', null, null, null, null, 'N', null, '[P1_SEQNC]', 'P1_SEQNC', sie$migrt$pkg.obten_var_page(10805, 'Insert'), 36365, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 70327276282470309, 'O', null, null, null, null, 'N', null, 'SNPI', 'SNPI', sie$migrt$pkg.obten_var_page(10800, 'Insert'), 36322, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 93067592679637942, 'O', null, null, null, null, 'N', null, '[SCPI]', 'SCPI', sie$migrt$pkg.obten_var_page(10800, 'Insert'), 36323, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 93067797874639465, 'O', null, null, null, null, 'N', null, '[SSPI]', 'SSPI', sie$migrt$pkg.obten_var_page(10800, 'Insert'), 36324, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 93068002722640812, 'O', null, null, null, null, 'N', null, '[SAPI]', 'SAPI', sie$migrt$pkg.obten_var_page(10800, 'Insert'), 36325, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 18958572122713254, 'O', null, null, null, null, 'N', null, '[SADA]', 'SADA', sie$migrt$pkg.obten_var_page(10800, 'Insert'), 36326, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 48503571405794162, 'O', null, null, null, null, 'N', null, 'Test', 'SIDF', sie$migrt$pkg.obten_var_page(10800, 'Insert'), 36327, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 48503798879794164, 'O', null, null, null, null, 'N', null, '[SSPC]', 'SSPC', sie$migrt$pkg.obten_var_page(10800, 'Insert'), 36328, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 48503973869794164, 'O', null, null, null, null, 'N', null, '[SCPC]', 'SCPC', sie$migrt$pkg.obten_var_page(10800, 'Insert'), 36329, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 48842792291413645, 'O', null, null, null, null, 'N', null, '[SAPC]', 'SAPC', sie$migrt$pkg.obten_var_page(10800, 'Insert'), 36330, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 49273473934805653, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12030_SEQNC', sie$migrt$pkg.obten_var_page(10802, 'Insert'), 36331, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 49273699942805654, 'O', null, null, null, null, 'O', null, 'Nom', 'P12030_NOM', sie$migrt$pkg.obten_var_page(10802, 'Insert'), 36332, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 49273892229805656, 'O', null, null, null, null, 'O', null, 'Prénom', 'P12030_PRENM', sie$migrt$pkg.obten_var_page(10802, 'Insert'), 36333, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 49274087024805656, 'O', null, null, null, null, 'O', null, 'Code utilisateur', 'P12030_CODE_UTILS', sie$migrt$pkg.obten_var_page(10802, 'Insert'), 36334, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 49278081752830267, 'O', null, null, null, null, 'N', null, 'Ancien mot de passe', 'P12030_ANCN_MOT_PASSE', sie$migrt$pkg.obten_var_page(10802, 'Insert'), 36335, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 49278291426830267, 'O', null, null, null, null, 'N', null, 'Nouveau mot de passe', 'P12030_NOUV_MOT_PASSE_1', sie$migrt$pkg.obten_var_page(10802, 'Insert'), 36336, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 49278479582830269, 'O', null, null, null, null, 'N', null, 'Confirmer le nouveau mot de passe', 'P12030_CONFR_MOT_PASSE', sie$migrt$pkg.obten_var_page(10802, 'Insert'), 36337, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 49280090194842195, 'O', null, null, null, null, 'N', null, 'Annuler', 'P12030_ANULR', sie$migrt$pkg.obten_var_page(10802, 'Insert'), 36338, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 49280298530842195, 'O', null, null, null, null, 'N', null, 'Définir le mot de passe', 'P12030_DEFNR_MOT_PASSE', sie$migrt$pkg.obten_var_page(10802, 'Insert'), 36339, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 49281678204848220, 'O', null, null, null, null, 'N', null, '[P12030_7_0]', 'P12030_7_0', sie$migrt$pkg.obten_var_page(10802, 'Insert'), 36340, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 422502724813505743, 'O', null, null, null, null, 'N', null, 'Application:', 'P102_APPLICATION_ID', sie$migrt$pkg.obten_var_page(11386, 'Insert'), 65992, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 422503225033505743, 'O', null, null, null, null, 'N', null, 'Page:', 'P102_PAGE_ID', sie$migrt$pkg.obten_var_page(11386, 'Insert'), 65993, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 422503755475505744, 'O', null, null, null, null, 'N', null, '[P102_A]', 'P102_A', sie$migrt$pkg.obten_var_page(11386, 'Insert'), 65994, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 422503933471505744, 'O', null, null, null, null, 'N', null, 'Commentaire', 'P102_FEEDBACK', sie$migrt$pkg.obten_var_page(11386, 'Insert'), 65995, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 422504456938505744, 'O', null, null, null, null, 'N', null, '[P102_X]', 'P102_X', sie$migrt$pkg.obten_var_page(11386, 'Insert'), 65996, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 422504656038505744, 'O', null, null, null, null, 'N', null, 'Type de commentaire', 'P102_FEEDBACK_TYPE', sie$migrt$pkg.obten_var_page(11386, 'Insert'), 65997, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 422505156529505745, 'O', null, null, null, null, 'N', null, '[P102_Y]', 'P102_Y', sie$migrt$pkg.obten_var_page(11386, 'Insert'), 65998, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 426533154054388001, 'O', null, null, null, null, 'N', null, '[P6_MODL_RECHR]', 'P6_MODL_RECHR', sie$migrt$pkg.obten_var_page(11723, 'Insert'), 106402, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 426135352868718192, 'O', null, null, null, null, 'N', null, 'Énoncé', 'P6_NOUV_RECHR', sie$migrt$pkg.obten_var_page(11723, 'Insert'), 106403, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 426264047360047202, 'O', null, null, null, null, 'N', null, 'dans', 'P6_SYSTM', sie$migrt$pkg.obten_var_page(11723, 'Insert'), 106406, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 426265526544088508, 'O', null, null, null, null, 'N', null, 'Exécuter', 'P6_EXECT', sie$migrt$pkg.obten_var_page(11723, 'Insert'), 106407, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 426186735648946926, 'O', null, null, null, null, 'N', null, 'selon', 'P6_EXECT_NOUV', sie$migrt$pkg.obten_var_page(11723, 'Insert'), 106409, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 424933332676784604, 'O', null, null, null, null, 'N', null, 'Recherches antérieures', 'P6_RECHR', sie$migrt$pkg.obten_var_page(11723, 'Insert'), 98950, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 424934327229839756, 'O', null, null, null, null, 'N', null, 'Éléments trouvés', 'P6_RESLT_RECHR', sie$migrt$pkg.obten_var_page(11723, 'Insert'), 98951, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 240761543786188990, 'O', null, null, null, null, 'N', null, '[P0_FILTR_RECHR]', 'P0_FILTR_RECHR', sie$migrt$pkg.obten_var_page(10800, 'Insert'), 43751, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(12, 'Insert'), 449732306941603496, 'N', null, null, null, null, 'N', null, 'Nouvelle recherche', 'P6_AUTRE_RECHR', sie$migrt$pkg.obten_var_page(11723, 'Insert'), 583938, 'BOUTN');
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
select seqnc into sie$migrt$pkg.var_page_item(110070) from sie_13_page_item where nom_apex = 'P6_SUPRS' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(40633) from sie_13_page_item where nom_apex = 'P51_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10984, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(40634) from sie_13_page_item where nom_apex = 'P51_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10984, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109574) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109575) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109576) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109577) from sie_13_page_item where nom_apex = 'CREATE_ADD' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109578) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109579) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10984, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109580) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10984, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109581) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10984, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109582) from sie_13_page_item where nom_apex = 'IMPR_TRAVL' and ref_page = sie$migrt$pkg.obten_var_page(10984, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109583) from sie_13_page_item where nom_apex = 'AJOUT_IMPRE' and ref_page = sie$migrt$pkg.obten_var_page(10984, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109584) from sie_13_page_item where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36341) from sie_13_page_item where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36342) from sie_13_page_item where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36343) from sie_13_page_item where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(10803, 'Select');
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
select seqnc into sie$migrt$pkg.var_page_item(36344) from sie_13_page_item where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36345) from sie_13_page_item where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(10803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36346) from sie_13_page_item where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36347) from sie_13_page_item where nom_apex = 'P12020_COURL' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36348) from sie_13_page_item where nom_apex = 'P12020_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36349) from sie_13_page_item where nom_apex = 'P12020_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36350) from sie_13_page_item where nom_apex = 'P12020_PRENM' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36351) from sie_13_page_item where nom_apex = 'P12020_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36352) from sie_13_page_item where nom_apex = 'P12020_DATE_EXPIR' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36353) from sie_13_page_item where nom_apex = 'P12020_INDIC_VERL' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36354) from sie_13_page_item where nom_apex = 'P12020_INDIC_CHANG_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36355) from sie_13_page_item where nom_apex = 'P12020_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36356) from sie_13_page_item where nom_apex = 'P12020_GROUP_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36357) from sie_13_page_item where nom_apex = 'P12020_FILTR_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36358) from sie_13_page_item where nom_apex = 'P12020_FILTR_MOT_CLE' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36359) from sie_13_page_item where nom_apex = 'P12020_APLIQ_FILTR' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36365) from sie_13_page_item where nom_apex = 'P1_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10805, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36322) from sie_13_page_item where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36323) from sie_13_page_item where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36324) from sie_13_page_item where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36325) from sie_13_page_item where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36326) from sie_13_page_item where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36327) from sie_13_page_item where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36328) from sie_13_page_item where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36329) from sie_13_page_item where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36330) from sie_13_page_item where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36331) from sie_13_page_item where nom_apex = 'P12030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36332) from sie_13_page_item where nom_apex = 'P12030_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36333) from sie_13_page_item where nom_apex = 'P12030_PRENM' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36334) from sie_13_page_item where nom_apex = 'P12030_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36335) from sie_13_page_item where nom_apex = 'P12030_ANCN_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36336) from sie_13_page_item where nom_apex = 'P12030_NOUV_MOT_PASSE_1' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36337) from sie_13_page_item where nom_apex = 'P12030_CONFR_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36338) from sie_13_page_item where nom_apex = 'P12030_ANULR' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36339) from sie_13_page_item where nom_apex = 'P12030_DEFNR_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36340) from sie_13_page_item where nom_apex = 'P12030_7_0' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(65992) from sie_13_page_item where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(65993) from sie_13_page_item where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(65994) from sie_13_page_item where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(65995) from sie_13_page_item where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(65996) from sie_13_page_item where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(65997) from sie_13_page_item where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(65998) from sie_13_page_item where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(106402) from sie_13_page_item where nom_apex = 'P6_MODL_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(106403) from sie_13_page_item where nom_apex = 'P6_NOUV_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(106406) from sie_13_page_item where nom_apex = 'P6_SYSTM' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(106407) from sie_13_page_item where nom_apex = 'P6_EXECT' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(106409) from sie_13_page_item where nom_apex = 'P6_EXECT_NOUV' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(98950) from sie_13_page_item where nom_apex = 'P6_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(98951) from sie_13_page_item where nom_apex = 'P6_RESLT_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(43751) from sie_13_page_item where nom_apex = 'P0_FILTR_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583938) from sie_13_page_item where nom_apex = 'P6_AUTRE_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
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
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2665, 'Update') where numr_apex = 6 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2342, 'Update') where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14142, 'Update') where numr_apex = 12030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2862, 'Update') where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2105, 'Update') where numr_apex = 12020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2964, 'Update') where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14143, 'Update') where numr_apex = 12021 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2004, 'Update') where numr_apex = 50 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2004, 'Update') where numr_apex = 51 and ref_aplic = sie$migrt$pkg.obten_var_aplic(12, 'Select');
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
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4356, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_IMEDT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4356, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4356, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STAT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4356, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOMBR_ELEMN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4356, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4356, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'LIEN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4356, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_TYPE_EVENM_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4274, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_EVENM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4274, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DNR_LIBL_STRUC_APLIC_HTML' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4696, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DNR_PERTN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4696, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DNR_LIEN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4696, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DNR_REF_STRUC_APLIC_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4696, 'Select');
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
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_SUPRS' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P51_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10984, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P51_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10984, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE_ADD' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10984, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10984, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10984, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'IMPR_TRAVL' and ref_page = sie$migrt$pkg.obten_var_page(10984, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'AJOUT_IMPRE' and ref_page = sie$migrt$pkg.obten_var_page(10984, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10803, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10803, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(10803, 'Select');
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
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10803, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(10803, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10803, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(10433, 'Update'), ref_opert = null where nom_apex = 'P12020_COURL' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(10434, 'Update'), ref_opert = null where nom_apex = 'P12020_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(10435, 'Update'), ref_opert = null where nom_apex = 'P12020_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(10436, 'Update'), ref_opert = null where nom_apex = 'P12020_PRENM' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(10437, 'Update'), ref_opert = null where nom_apex = 'P12020_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(10438, 'Update'), ref_opert = null where nom_apex = 'P12020_DATE_EXPIR' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(10439, 'Update'), ref_opert = null where nom_apex = 'P12020_INDIC_VERL' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(10440, 'Update'), ref_opert = null where nom_apex = 'P12020_INDIC_CHANG_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(10441, 'Update'), ref_opert = null where nom_apex = 'P12020_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(10442, 'Update'), ref_opert = null where nom_apex = 'P12020_GROUP_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(10443, 'Update'), ref_opert = null where nom_apex = 'P12020_FILTR_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(10444, 'Update'), ref_opert = null where nom_apex = 'P12020_FILTR_MOT_CLE' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = sie$migrt$pkg.obten_var_mesg(10445, 'Update'), ref_opert = null where nom_apex = 'P12020_APLIQ_FILTR' and ref_page = sie$migrt$pkg.obten_var_page(10804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10805, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_PRENM' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_ANCN_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_NOUV_MOT_PASSE_1' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_CONFR_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_ANULR' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_DEFNR_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_7_0' and ref_page = sie$migrt$pkg.obten_var_page(10802, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(11386, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_MODL_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_NOUV_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_SYSTM' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_EXECT' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_EXECT_NOUV' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_RESLT_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P0_FILTR_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(10800, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_AUTRE_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11723, 'Select');
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
                           ref_aplic_authe = sie$migrt$pkg.obten_var_aplic(5, 'Update'),
                           ref_page_conxn = sie$migrt$pkg.obten_var_page(10803, 'Update')
                     where seqnc = sie$migrt$pkg.obten_var_aplic(12);
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_aplic');
end;
/
begin
  if sie$migrt$pkg.vnu_sql_code = 0 then
    dbms_output.put_line ('Mise a jour du referentiel pour application : SAFU - SIE APEX Framework - Utilisateur');
    sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(12),'O');
  end if;
end;
/

