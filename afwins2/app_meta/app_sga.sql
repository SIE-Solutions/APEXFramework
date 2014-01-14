set define off
set serveroutput on
set feedback off

alter session set current_schema = afw_040215;


begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - Initialisation - Application - SGA');
  sie$migrt$pkg.var_aplic(187) := sie_11_aplic_pkg.maj_aplic ('SGA','SIE Global Access',1000002, sie$migrt$pkg.vnu_seqnc_prodt);

  sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(187),'O');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - Initialisation - Application - SGA');
end;
/


--Debut - sie_11_versn
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_11_versn');
delete from tc$11$versn;

insert into tc$11$versn (code, dnr_ref_aplic, dnr_ref_prodt, indic_docmn_verl, nom, numr_versn_1, numr_versn_2, numr_versn_3, numr_versn_4, ref_aplic, ref_plugn, ref_prodt, seqnc) values ('3000', sie$migrt$pkg.obten_var_aplic(187, 'Insert'), null, 'O', null, 3, 0, 0, 0, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), null, null, 183);

merge into sie_11_versn t
                        using tc$11$versn tf
               on ((t.code = tf.code) and (t.ref_aplic = tf.ref_aplic or (t.ref_aplic is null and tf.ref_aplic is null) or tf.ref_aplic is null ) and (t.ref_plugn = tf.ref_plugn or (t.ref_plugn is null and tf.ref_plugn is null) or tf.ref_plugn is null ) and (t.ref_prodt = tf.ref_prodt or (t.ref_prodt is null and tf.ref_prodt is null) or tf.ref_prodt is null ))
when not matched then
              insert (t.code, t.dnr_ref_aplic, t.dnr_ref_prodt, t.indic_docmn_verl, t.nom, t.numr_versn_1, t.numr_versn_2, t.numr_versn_3, t.numr_versn_4, t.ref_aplic, t.ref_plugn, t.ref_prodt)
              values (tf.code, tf.dnr_ref_aplic, tf.dnr_ref_prodt, tf.indic_docmn_verl, tf.nom, tf.numr_versn_1, tf.numr_versn_2, tf.numr_versn_3, tf.numr_versn_4, tf.ref_aplic, tf.ref_plugn, tf.ref_prodt)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.dnr_ref_prodt = tf.dnr_ref_prodt, t.indic_docmn_verl = tf.indic_docmn_verl, t.nom = tf.nom, t.numr_versn_1 = tf.numr_versn_1, t.numr_versn_2 = tf.numr_versn_2, t.numr_versn_3 = tf.numr_versn_3, t.numr_versn_4 = tf.numr_versn_4
log errors into em$11_versn
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$11_versn;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_11_versn');
  end if;
end;

select seqnc into sie$migrt$pkg.var_versn(183) from sie_11_versn where code = '3000' and ref_aplic = sie$migrt$pkg.obten_var_aplic(187, 'Select') and ref_plugn is null and ref_prodt is null;
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

insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:04', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page commune', 0, null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 17149);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:04', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 'O', 'O', 'N', 'N', 'N', 'N', 'N', 'Connexion', 101, null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 17150);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:04', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 'O', 'O', 'N', 'N', 'N', 'N', 'N', 'Mot de passe oublié', 103, null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 17152);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:04', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Code d''utilisateur oublié', 104, null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 17153);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:04', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 'O', 'O', 'N', 'N', 'N', 'N', 'N', 'Réinitialiser un mot de passe', 105, null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 17154);

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

select seqnc into sie$migrt$pkg.var_page(17149) from sie_13_page where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(187, 'Select');
select seqnc into sie$migrt$pkg.var_page(17150) from sie_13_page where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(187, 'Select');
select seqnc into sie$migrt$pkg.var_page(17152) from sie_13_page where numr_apex = 103 and ref_aplic = sie$migrt$pkg.obten_var_aplic(187, 'Select');
select seqnc into sie$migrt$pkg.var_page(17153) from sie_13_page where numr_apex = 104 and ref_aplic = sie$migrt$pkg.obten_var_aplic(187, 'Select');
select seqnc into sie$migrt$pkg.var_page(17154) from sie_13_page where numr_apex = 105 and ref_aplic = sie$migrt$pkg.obten_var_aplic(187, 'Select');
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

insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 'Page commune', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17149, 'Insert'), 13833);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 'Login', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17150, 'Insert'), 13834);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 'Mot de passe oublié', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17152, 'Insert'), 13836);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 'Code d''utilisateur oublié', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17153, 'Insert'), 13837);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 'Réinitialiser un mot de passe', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17154, 'Insert'), 13838);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 'Page commune', sie$migrt$pkg.obten_var_lang(162, 'Insert'), sie$migrt$pkg.obten_var_page(17149, 'Insert'), 13840);

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

select seqnc into sie$migrt$pkg.var_page_lang(13833) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13834) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13836) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17152, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13837) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17153, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13838) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17154, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13840) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(162, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
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

insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 128559938022013552, 'O', null, null, null, null, 'N', null, 'Code utilisateur oublié ?', 'P101_CODE_UTILS_OUBLI', sie$migrt$pkg.obten_var_page(17150, 'Insert'), 229558, 'ITEM');
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
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 128569455429081507, 'O', null, null, null, null, 'N', null, 'Mot de passe oublié ?', 'P101_MOT_PASSE_OUBLI', sie$migrt$pkg.obten_var_page(17150, 'Insert'), 229559, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 128570236007105658, 'O', null, null, null, null, 'N', null, 'Créer un compte SEM', 'P101_CREER_UTILS', sie$migrt$pkg.obten_var_page(17150, 'Insert'), 229560, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 160685640623078711, 'O', null, null, null, null, 'N', null, '[P101_TYPE_REQT_INTER_CODE]', 'P101_TYPE_REQT_INTER_CODE', sie$migrt$pkg.obten_var_page(17150, 'Insert'), 229561, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 946099443801818005, 'O', null, null, null, null, 'N', null, '[SADA]', 'SADA', sie$migrt$pkg.obten_var_page(17149, 'Insert'), 218397, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 1047408577273397431, 'O', null, null, null, null, 'N', null, 'Test', 'SIDF', sie$migrt$pkg.obten_var_page(17149, 'Insert'), 218398, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 1047408804747397433, 'O', null, null, null, null, 'N', null, '[SSPC]', 'SSPC', sie$migrt$pkg.obten_var_page(17149, 'Insert'), 218399, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 1047408979737397433, 'O', null, null, null, null, 'N', null, '[SCPC]', 'SCPC', sie$migrt$pkg.obten_var_page(17149, 'Insert'), 218400, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 1047747798159016914, 'O', null, null, null, null, 'N', null, '[SAPC]', 'SAPC', sie$migrt$pkg.obten_var_page(17149, 'Insert'), 218401, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 1056902576846998330, 'O', null, null, null, null, 'N', null, '[SNPI]', 'SNPI', sie$migrt$pkg.obten_var_page(17149, 'Insert'), 218402, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 1079692379389630127, 'O', null, null, null, null, 'N', null, '[SCPI]', 'SCPI', sie$migrt$pkg.obten_var_page(17149, 'Insert'), 218403, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 1079692585968632021, 'O', null, null, null, null, 'N', null, '[SSPI]', 'SSPI', sie$migrt$pkg.obten_var_page(17149, 'Insert'), 218404, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 1079692790124633251, 'O', null, null, null, null, 'N', null, '[SAPI]', 'SAPI', sie$migrt$pkg.obten_var_page(17149, 'Insert'), 218405, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 946412145016900399, 'O', null, null, null, null, 'N', null, '[P101_MODE]', 'P101_MODE', sie$migrt$pkg.obten_var_page(17150, 'Insert'), 218406, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 1036105686874589465, 'O', null, null, null, null, 'N', null, '[P101_LANG]', 'P101_LANG', sie$migrt$pkg.obten_var_page(17150, 'Insert'), 218407, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 1037269989518434319, 'O', null, null, null, null, 'N', null, '[P101_DOMN]', 'P101_DOMN', sie$migrt$pkg.obten_var_page(17150, 'Insert'), 218408, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 1037271397717578596, 'O', null, null, null, null, 'N', null, '[P101_FORCE_DOMN]', 'P101_FORCE_DOMN', sie$migrt$pkg.obten_var_page(17150, 'Insert'), 218409, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 1049189795328501541, 'O', null, null, null, null, 'N', null, '[P101_CODE_UTILS]', 'P101_CODE_UTILS', sie$migrt$pkg.obten_var_page(17150, 'Insert'), 218410, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 1049189993521501541, 'O', null, null, null, null, 'N', null, '[P101_MOT_PASSE]', 'P101_MOT_PASSE', sie$migrt$pkg.obten_var_page(17150, 'Insert'), 218411, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 1049190198946501541, 'O', null, null, null, null, 'N', null, 'Connexion', 'P101_LOGIN', sie$migrt$pkg.obten_var_page(17150, 'Insert'), 218412, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 946102658309869481, 'O', null, null, null, null, 'N', null, '[P103_CODE]', 'P103_CODE', sie$migrt$pkg.obten_var_page(17152, 'Insert'), 218428, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 946102936622872704, 'O', null, null, null, null, 'N', null, '[P103_COURL]', 'P103_COURL', sie$migrt$pkg.obten_var_page(17152, 'Insert'), 218429, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 946182137045655306, 'O', null, null, null, null, 'N', null, '[P103_DOMN]', 'P103_DOMN', sie$migrt$pkg.obten_var_page(17152, 'Insert'), 218430, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 491082327528359553, 'N', null, null, null, null, 'N', null, 'Envoyer', 'REINT_MOT_PASSE', sie$migrt$pkg.obten_var_page(17152, 'Insert'), 218431, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 946439547392272922, 'O', null, null, null, null, 'N', null, '[P104_DOMN]', 'P104_DOMN', sie$migrt$pkg.obten_var_page(17153, 'Insert'), 218432, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 1016838465234722319, 'O', null, null, null, null, 'N', null, '[P104_COURL]', 'P104_COURL', sie$migrt$pkg.obten_var_page(17153, 'Insert'), 218433, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 494199749027984389, 'N', null, null, null, null, 'N', null, 'Envoyer', 'OBTEN_CODE_UTILS', sie$migrt$pkg.obten_var_page(17153, 'Insert'), 218434, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 946398563184725301, 'O', null, null, null, null, 'N', null, '[P105_MOT_PASSE]', 'P105_MOT_PASSE', sie$migrt$pkg.obten_var_page(17154, 'Insert'), 218435, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 946398740459728193, 'O', null, null, null, null, 'N', null, '[P105_CONFR_MOT_PASSE]', 'P105_CONFR_MOT_PASSE', sie$migrt$pkg.obten_var_page(17154, 'Insert'), 218436, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(187, 'Insert'), 423756332359954526, 'N', null, null, null, null, 'N', null, 'Réinitialiser', 'REINT_MOT_PASSE', sie$migrt$pkg.obten_var_page(17154, 'Insert'), 218437, 'BOUTN');
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
select seqnc into sie$migrt$pkg.var_page_item(229558) from sie_13_page_item where nom_apex = 'P101_CODE_UTILS_OUBLI' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
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
select seqnc into sie$migrt$pkg.var_page_item(229559) from sie_13_page_item where nom_apex = 'P101_MOT_PASSE_OUBLI' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(229560) from sie_13_page_item where nom_apex = 'P101_CREER_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(229561) from sie_13_page_item where nom_apex = 'P101_TYPE_REQT_INTER_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218397) from sie_13_page_item where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218398) from sie_13_page_item where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218399) from sie_13_page_item where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218400) from sie_13_page_item where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218401) from sie_13_page_item where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218402) from sie_13_page_item where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218403) from sie_13_page_item where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218404) from sie_13_page_item where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218405) from sie_13_page_item where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218406) from sie_13_page_item where nom_apex = 'P101_MODE' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218407) from sie_13_page_item where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218408) from sie_13_page_item where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218409) from sie_13_page_item where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218410) from sie_13_page_item where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218411) from sie_13_page_item where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218412) from sie_13_page_item where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218428) from sie_13_page_item where nom_apex = 'P103_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17152, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218429) from sie_13_page_item where nom_apex = 'P103_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17152, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218430) from sie_13_page_item where nom_apex = 'P103_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17152, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218431) from sie_13_page_item where nom_apex = 'REINT_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17152, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218432) from sie_13_page_item where nom_apex = 'P104_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17153, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218433) from sie_13_page_item where nom_apex = 'P104_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17153, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218434) from sie_13_page_item where nom_apex = 'OBTEN_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17153, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218435) from sie_13_page_item where nom_apex = 'P105_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17154, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218436) from sie_13_page_item where nom_apex = 'P105_CONFR_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17154, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218437) from sie_13_page_item where nom_apex = 'REINT_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17154, 'Select');
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
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(187, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4574, 'Update') where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(187, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4575, 'Update') where numr_apex = 103 and ref_aplic = sie$migrt$pkg.obten_var_aplic(187, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4494, 'Update') where numr_apex = 104 and ref_aplic = sie$migrt$pkg.obten_var_aplic(187, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4576, 'Update') where numr_apex = 105 and ref_aplic = sie$migrt$pkg.obten_var_aplic(187, 'Select');
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
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CODE_UTILS_OUBLI' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
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
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MOT_PASSE_OUBLI' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CREER_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_TYPE_REQT_INTER_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(17149, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MODE' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(17150, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P103_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17152, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P103_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17152, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P103_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17152, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'REINT_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17152, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P104_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17153, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P104_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17153, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'OBTEN_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17153, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P105_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17154, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P105_CONFR_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17154, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'REINT_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17154, 'Select');
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
                       set ref_versn = sie$migrt$pkg.obten_var_versn(183, 'Update'),
                           indic_aplic_authe = 'O',
                           ref_aplic_authe = null,
                           ref_page_conxn = sie$migrt$pkg.obten_var_page(17150, 'Update')
                     where seqnc = sie$migrt$pkg.obten_var_aplic(187);
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_aplic');
end;
/
begin
  if sie$migrt$pkg.vnu_sql_code = 0 then
    dbms_output.put_line ('Mise a jour du referentiel pour application : SGA - SIE Global Access');
    sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(187),'O');
  end if;
end;
/

