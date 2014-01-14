set define off
set serveroutput on
set feedback off

alter session set current_schema = afw_040215;


begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - Initialisation - Application - SAFA');
  sie$migrt$pkg.var_aplic(322) := sie_11_aplic_pkg.maj_aplic ('SAFA','SIE APEX Framework - Assurance qualité',1000008, sie$migrt$pkg.vnu_seqnc_prodt);

  sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(322),'O');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - Initialisation - Application - SAFA');
end;
/


--Debut - sie_11_versn
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_11_versn');
delete from tc$11$versn;

insert into tc$11$versn (code, dnr_ref_aplic, dnr_ref_prodt, indic_docmn_verl, nom, numr_versn_1, numr_versn_2, numr_versn_3, numr_versn_4, ref_aplic, ref_plugn, ref_prodt, seqnc) values ('0100', sie$migrt$pkg.obten_var_aplic(322, 'Insert'), null, 'O', null, 0, 1, 0, 0, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), null, null, 222);

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

select seqnc into sie$migrt$pkg.var_versn(222) from sie_11_versn where code = '0100' and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select') and ref_plugn is null and ref_prodt is null;
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

insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Validations', 1001, null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 17961);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page commune', 0, null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 17962);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page de connexion', 101, null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 17963);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des applications d''un produit', 2, null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 17964);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Validations', 1011, null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 17965);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des produits', 1, null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 17966);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Commentaire', 102, null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 17967);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des pages d''une application', 3, null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 17968);

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

select seqnc into sie$migrt$pkg.var_page(17961) from sie_13_page where numr_apex = 1001 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
select seqnc into sie$migrt$pkg.var_page(17962) from sie_13_page where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
select seqnc into sie$migrt$pkg.var_page(17963) from sie_13_page where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
select seqnc into sie$migrt$pkg.var_page(17964) from sie_13_page where numr_apex = 2 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
select seqnc into sie$migrt$pkg.var_page(17965) from sie_13_page where numr_apex = 1011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
select seqnc into sie$migrt$pkg.var_page(17966) from sie_13_page where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
select seqnc into sie$migrt$pkg.var_page(17967) from sie_13_page where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
select seqnc into sie$migrt$pkg.var_page(17968) from sie_13_page where numr_apex = 3 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
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

insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'Validations', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17961, 'Insert'), 14644);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'Page commune', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17962, 'Insert'), 14645);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'Page de connexion', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17963, 'Insert'), 14646);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'Planification', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17964, 'Insert'), 14647);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'Validations', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17965, 'Insert'), 14648);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'Assurance qualité', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17966, 'Insert'), 14649);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'Commentaire', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17967, 'Insert'), 14650);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'Pages d''une application', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17968, 'Insert'), 14651);

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

select seqnc into sie$migrt$pkg.var_page_lang(14644) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17961, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14645) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14646) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17963, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14647) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17964, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14648) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17965, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14649) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17966, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14650) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14651) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17968, 'Select');
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

insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'N', null, 'Applications', 1, sie$migrt$pkg.obten_var_page(17964, 'Insert'), 7367, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'N', null, 'Liste des produits', 1, sie$migrt$pkg.obten_var_page(17966, 'Insert'), 7368, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 'N', null, 'Pages', 1, sie$migrt$pkg.obten_var_page(17968, 'Insert'), 7369, null);
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
select seqnc into sie$migrt$pkg.var_page_ir(7367) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17964, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7368) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17966, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7369) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17968, 'Select');
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

insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 457008829018059578, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7367, 'Insert'), 61479, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 457008930651059578, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7367, 'Insert'), 61480, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM_FORMT', sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 457009035090059578, 'O', null, 'Nom', 4, sie$migrt$pkg.obten_var_page_ir(7367, 'Insert'), 61481, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APLIC_APEX', sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 457009316289059578, 'O', null, 'Numéro', 7, sie$migrt$pkg.obten_var_page_ir(7367, 'Insert'), 61482, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 457003805532900903, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7368, 'Insert'), 61483, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 457003925159900904, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7368, 'Insert'), 61484, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 457004019979900904, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7368, 'Insert'), 61485, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 457015535932073191, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7369, 'Insert'), 61486, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APEX', sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 457015618298073191, 'O', null, 'Numéro', 2, sie$migrt$pkg.obten_var_page_ir(7369, 'Insert'), 61487, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 457015722812073191, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7369, 'Insert'), 61488, null);
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
select seqnc into sie$migrt$pkg.var_page_ir_coln(61479) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7367, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61480) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7367, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61481) from sie_13_page_ir_coln where coln_table = 'NOM_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7367, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61482) from sie_13_page_ir_coln where coln_table = 'NUMR_APLIC_APEX' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7367, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61483) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7368, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61484) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7368, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61485) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7368, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61486) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7369, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61487) from sie_13_page_ir_coln where coln_table = 'NUMR_APEX' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7369, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61488) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7369, 'Select');
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

insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 457344617602926889, 'O', null, null, null, null, 'N', null, '[P1001_MODE]', 'P1001_MODE', sie$migrt$pkg.obten_var_page(17961, 'Insert'), 227999, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 1979678257017752121, 'O', null, null, null, null, 'N', null, '[SADA]', 'SADA', sie$migrt$pkg.obten_var_page(17962, 'Insert'), 228000, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2009223256300833029, 'O', null, null, null, null, 'N', null, 'Test', 'SIDF', sie$migrt$pkg.obten_var_page(17962, 'Insert'), 228001, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2009223483774833031, 'O', null, null, null, null, 'N', null, '[SSPC]', 'SSPC', sie$migrt$pkg.obten_var_page(17962, 'Insert'), 228002, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2009223658764833031, 'O', null, null, null, null, 'N', null, '[SCPC]', 'SCPC', sie$migrt$pkg.obten_var_page(17962, 'Insert'), 228003, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2009562477186452512, 'O', null, null, null, null, 'N', null, '[SAPC]', 'SAPC', sie$migrt$pkg.obten_var_page(17962, 'Insert'), 228004, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2031046961177509176, 'O', null, null, null, null, 'N', null, 'SNPI', 'SNPI', sie$migrt$pkg.obten_var_page(17962, 'Insert'), 228005, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2053787277574676809, 'O', null, null, null, null, 'N', null, '[SCPI]', 'SCPI', sie$migrt$pkg.obten_var_page(17962, 'Insert'), 228006, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2053787482769678332, 'O', null, null, null, null, 'N', null, '[SSPI]', 'SSPI', sie$migrt$pkg.obten_var_page(17962, 'Insert'), 228007, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2053787687617679679, 'O', null, null, null, null, 'N', null, '[SAPI]', 'SAPI', sie$migrt$pkg.obten_var_page(17962, 'Insert'), 228008, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2125501021274740622, 'O', null, null, null, null, 'N', null, '[P0_RECHR_GLOBL]', 'P0_RECHR_GLOBL', sie$migrt$pkg.obten_var_page(17962, 'Insert'), 228009, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 1979977037017309273, 'O', null, null, null, null, 'N', null, 'Code d''utilisateur', 'P101_CODE_UTILS', sie$migrt$pkg.obten_var_page(17963, 'Insert'), 228010, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 1979977245401309274, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P101_MOT_PASSE', sie$migrt$pkg.obten_var_page(17963, 'Insert'), 228011, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 1979977434732309274, 'O', null, null, null, null, 'N', null, 'Connexion', 'P101_LOGIN', sie$migrt$pkg.obten_var_page(17963, 'Insert'), 228012, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 1979977637285309274, 'O', null, null, null, null, 'N', null, 'Domaine', 'P101_DOMN', sie$migrt$pkg.obten_var_page(17963, 'Insert'), 228013, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 1979977837249309275, 'O', null, null, null, null, 'N', null, '[P101_LANG]', 'P101_LANG', sie$migrt$pkg.obten_var_page(17963, 'Insert'), 228014, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 1979978030730309275, 'O', null, null, null, null, 'N', null, '[P101_FORCE_DOMN]', 'P101_FORCE_DOMN', sie$migrt$pkg.obten_var_page(17963, 'Insert'), 228015, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 457398934420471079, 'O', null, null, null, null, 'N', null, '[P1011_MODE]', 'P1011_MODE', sie$migrt$pkg.obten_var_page(17965, 'Insert'), 228016, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2383218344958644642, 'O', null, null, null, null, 'N', null, 'Application:', 'P102_APPLICATION_ID', sie$migrt$pkg.obten_var_page(17967, 'Insert'), 228017, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2383218848782644645, 'O', null, null, null, null, 'N', null, 'Page:', 'P102_PAGE_ID', sie$migrt$pkg.obten_var_page(17967, 'Insert'), 228018, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2383219328709644645, 'O', null, null, null, null, 'N', null, '[P102_A]', 'P102_A', sie$migrt$pkg.obten_var_page(17967, 'Insert'), 228019, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2383219545635644646, 'O', null, null, null, null, 'N', null, 'Commentaire', 'P102_FEEDBACK', sie$migrt$pkg.obten_var_page(17967, 'Insert'), 228020, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2383220043730644647, 'O', null, null, null, null, 'N', null, '[P102_X]', 'P102_X', sie$migrt$pkg.obten_var_page(17967, 'Insert'), 228021, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2383220251672644647, 'O', null, null, null, null, 'N', null, 'Type de commentaire', 'P102_FEEDBACK_TYPE', sie$migrt$pkg.obten_var_page(17967, 'Insert'), 228022, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2383220751443644647, 'O', null, null, null, null, 'N', null, '[P102_Y]', 'P102_Y', sie$migrt$pkg.obten_var_page(17967, 'Insert'), 228023, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(322, 'Insert'), 2379628243968330541, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SUBMIT', sie$migrt$pkg.obten_var_page(17967, 'Insert'), 228024, 'BOUTN');
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
select seqnc into sie$migrt$pkg.var_page_item(227999) from sie_13_page_item where nom_apex = 'P1001_MODE' and ref_page = sie$migrt$pkg.obten_var_page(17961, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228000) from sie_13_page_item where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228001) from sie_13_page_item where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228002) from sie_13_page_item where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228003) from sie_13_page_item where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228004) from sie_13_page_item where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228005) from sie_13_page_item where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228006) from sie_13_page_item where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228007) from sie_13_page_item where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228008) from sie_13_page_item where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228009) from sie_13_page_item where nom_apex = 'P0_RECHR_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228010) from sie_13_page_item where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228011) from sie_13_page_item where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228012) from sie_13_page_item where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(17963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228013) from sie_13_page_item where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228014) from sie_13_page_item where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(17963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228015) from sie_13_page_item where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228016) from sie_13_page_item where nom_apex = 'P1011_MODE' and ref_page = sie$migrt$pkg.obten_var_page(17965, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228017) from sie_13_page_item where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228018) from sie_13_page_item where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228019) from sie_13_page_item where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228020) from sie_13_page_item where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228021) from sie_13_page_item where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228022) from sie_13_page_item where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228023) from sie_13_page_item where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228024) from sie_13_page_item where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
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
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1001 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4574, 'Update') where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Update') where numr_apex = 2 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Update') where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4561, 'Update') where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Update') where numr_apex = 3 and ref_aplic = sie$migrt$pkg.obten_var_aplic(322, 'Select');
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
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7367, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7367, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7367, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APLIC_APEX' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7367, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7368, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7368, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7368, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7369, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APEX' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7369, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7369, 'Select');
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
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1001_MODE' and ref_page = sie$migrt$pkg.obten_var_page(17961, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P0_RECHR_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(17962, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(17963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(17963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1011_MODE' and ref_page = sie$migrt$pkg.obten_var_page(17965, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(17967, 'Select');
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
                       set ref_versn = sie$migrt$pkg.obten_var_versn(222, 'Update'),
                           indic_aplic_authe = 'O',
                           ref_aplic_authe = sie$migrt$pkg.obten_var_aplic(187, 'Update'),
                           ref_page_conxn = sie$migrt$pkg.obten_var_page(17963, 'Update')
                     where seqnc = sie$migrt$pkg.obten_var_aplic(322);
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_aplic');
end;
/
begin
  if sie$migrt$pkg.vnu_sql_code = 0 then
    dbms_output.put_line ('Mise a jour du referentiel pour application : SAFA - SIE APEX Framework - Assurance qualité');
    sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(322),'O');
  end if;
end;
/

