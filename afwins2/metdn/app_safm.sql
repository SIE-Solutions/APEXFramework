--Méta
set define off
set serveroutput on
set feedback off

alter session set current_schema = afw_040200;


begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - Initialisation - Application - SAFM');
  sie$migrt$pkg.var_aplic(59) := sie_11_aplic_pkg.maj_aplic ('SAFM','SIE APEX Framework - Méthodologie',1000006, sie$migrt$pkg.vnu_seqnc_prodt);

  sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(59),'O');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - Initialisation - Application - SAFM');
end;
/


--Debut - sie_11_versn
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_11_versn');
delete from tc$11$versn;

insert into tc$11$versn (code, dnr_ref_aplic, dnr_ref_prodt, indic_docmn_verl, nom, numr_versn_1, numr_versn_2, numr_versn_3, numr_versn_4, ref_aplic, ref_plugn, ref_prodt, seqnc) values ('0100', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), null, 'O', null, 0, 1, 0, 0, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), null, null, 1042);

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

select seqnc into sie$migrt$pkg.var_versn(1042) from sie_11_versn where code = '0100' and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select') and ref_plugn is null and ref_prodt is null;
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

insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Rôles', 1041, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52803);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Rôle', 1042, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52804);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page commune', 0, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 11803);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page de connexion', 101, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 11804);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Accueil', 1, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 11805);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Commentaire', 102, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 11806);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des produits', 1001, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52725);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Tâche', 1052, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52843);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Tâches', 1051, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52844);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Planification efforts', 1054, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 53163);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Affectations', 1053, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52923);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Rôle utilisateur', 1043, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52823);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Lien équipe', 1013, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52743);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Équipe jalon', 1023, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52744);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mes tâches', 1055, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 53323);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Équipes', 1011, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52703);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Jalon', 1022, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52704);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Jalons', 1021, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52705);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Disponibilités', 1031, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52783);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Disponibilité', 1032, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52784);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Consulter une tâche', 1056, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 53343);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Équipe', 1012, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52723);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Planification', 2, null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 52724);

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

select seqnc into sie$migrt$pkg.var_page(52803) from sie_13_page where numr_apex = 1041 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(52804) from sie_13_page where numr_apex = 1042 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(11803) from sie_13_page where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(11804) from sie_13_page where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(11805) from sie_13_page where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(11806) from sie_13_page where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(52725) from sie_13_page where numr_apex = 1001 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(52843) from sie_13_page where numr_apex = 1052 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(52844) from sie_13_page where numr_apex = 1051 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(53163) from sie_13_page where numr_apex = 1054 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(52923) from sie_13_page where numr_apex = 1053 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(52823) from sie_13_page where numr_apex = 1043 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(52743) from sie_13_page where numr_apex = 1013 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(52744) from sie_13_page where numr_apex = 1023 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(53323) from sie_13_page where numr_apex = 1055 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(52703) from sie_13_page where numr_apex = 1011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(52704) from sie_13_page where numr_apex = 1022 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(52705) from sie_13_page where numr_apex = 1021 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(52783) from sie_13_page where numr_apex = 1031 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(52784) from sie_13_page where numr_apex = 1032 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(53343) from sie_13_page where numr_apex = 1056 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(52723) from sie_13_page where numr_apex = 1012 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
select seqnc into sie$migrt$pkg.var_page(52724) from sie_13_page where numr_apex = 2 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
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

insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Affectations', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(53163, 'Insert'), 50204);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Mes tâches', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(53323, 'Insert'), 50364);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Rôle', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52804, 'Insert'), 49844);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Rôles', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52803, 'Insert'), 49845);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Commentaire', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11806, 'Insert'), 9144);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Méthodologie', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11805, 'Insert'), 9145);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Page de connexion', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11804, 'Insert'), 9146);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Page commune', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11803, 'Insert'), 9147);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Planification', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52724, 'Insert'), 49764);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Équipe', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52723, 'Insert'), 49765);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Produits', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52725, 'Insert'), 49766);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Équipe', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52744, 'Insert'), 49784);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Membre', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52743, 'Insert'), 49785);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Tâches', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52844, 'Insert'), 49884);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Tâche', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52843, 'Insert'), 49885);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Effort', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52923, 'Insert'), 49964);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Rôle utilisateur', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52823, 'Insert'), 49864);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Disponibilité', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52784, 'Insert'), 49824);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Disponibilités', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52783, 'Insert'), 49825);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Consulter une tâche', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(53343, 'Insert'), 50384);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Jalons', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52705, 'Insert'), 49744);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Jalon', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52704, 'Insert'), 49745);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'Équipes', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52703, 'Insert'), 49746);

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

select seqnc into sie$migrt$pkg.var_page_lang(50204) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(53163, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(50364) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(53323, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49844) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49845) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52803, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(9144) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(9145) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11805, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(9146) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11804, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(9147) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49764) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52724, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49765) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49766) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52725, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49784) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49785) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49884) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52844, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49885) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49964) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52923, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49864) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49824) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49825) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52783, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(50384) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49744) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52705, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49745) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49746) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52703, 'Select');
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

insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'N', null, 'Mes tâche', 1, sie$migrt$pkg.obten_var_page(53323, 'Insert'), 25696, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'N', null, 'Rôles utilisateur', 1, sie$migrt$pkg.obten_var_page(52804, 'Insert'), 25516, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'N', null, 'Liste des systèmes', 1, sie$migrt$pkg.obten_var_page(52725, 'Insert'), 25436, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'N', null, 'Équipes', 1, sie$migrt$pkg.obten_var_page(52703, 'Insert'), 25416, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'N', null, 'Jalons', 1, sie$migrt$pkg.obten_var_page(52705, 'Insert'), 25417, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'N', null, 'Liens équipes', 1, sie$migrt$pkg.obten_var_page(52723, 'Insert'), 25476, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'N', null, 'Disponibilités utilisateurs', 1, sie$migrt$pkg.obten_var_page(52783, 'Insert'), 25477, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'N', null, 'Rôles', 1, sie$migrt$pkg.obten_var_page(52803, 'Insert'), 25478, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'N', null, 'Jalon par équipe', 1, sie$migrt$pkg.obten_var_page(52704, 'Insert'), 25456, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 'N', null, 'Tâches', 1, sie$migrt$pkg.obten_var_page(52844, 'Insert'), 25536, null);
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
select seqnc into sie$migrt$pkg.var_page_ir(25696) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(53323, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25516) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25436) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(52725, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25416) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(52703, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25417) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(52705, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25476) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25477) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(52783, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25478) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(52803, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25456) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25536) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(52844, 'Select');
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

insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456675448652875891, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25476, 'Insert'), 265093, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_EQUIP', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456675531745875891, 'O', null, 'Équipe', 2, sie$migrt$pkg.obten_var_page_ir(25476, 'Insert'), 265094, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456675643324875892, 'O', null, 'Utilisateur', 3, sie$migrt$pkg.obten_var_page_ir(25476, 'Insert'), 265095, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DEBUT_EFECT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456675735863875892, 'O', null, 'Début effectivité', 4, sie$migrt$pkg.obten_var_page_ir(25476, 'Insert'), 265096, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('FIN_EFECT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456675819768875892, 'O', null, 'Fin effectivité', 5, sie$migrt$pkg.obten_var_page_ir(25476, 'Insert'), 265097, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('POURC_IMPLI_EQUIP', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456675950708875892, 'O', null, 'Pourcentage', 6, sie$migrt$pkg.obten_var_page_ir(25476, 'Insert'), 265098, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS_FORMT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456713934433037159, 'O', null, 'Utilisateur', 7, sie$migrt$pkg.obten_var_page_ir(25476, 'Insert'), 265099, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456766239635401708, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25477, 'Insert'), 265100, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS_FORMT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456766344688401710, 'O', null, 'Utilisateur', 2, sie$migrt$pkg.obten_var_page_ir(25477, 'Insert'), 265101, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DEBUT_EFECT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456766446609401711, 'O', null, 'Debut effectivité', 3, sie$migrt$pkg.obten_var_page_ir(25477, 'Insert'), 265102, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('EFORT_DISPN_SEMN', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456766537222401711, 'O', null, 'Effort disponible', 4, sie$migrt$pkg.obten_var_page_ir(25477, 'Insert'), 265103, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('FIN_EFECT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456766630657401711, 'O', null, 'Fin effectivité', 5, sie$migrt$pkg.obten_var_page_ir(25477, 'Insert'), 265104, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456804625609591164, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25478, 'Insert'), 265105, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456804730253591165, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(25478, 'Insert'), 265106, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456804834924591165, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(25478, 'Insert'), 265107, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456804945120591165, 'O', null, 'Description', 4, sie$migrt$pkg.obten_var_page_ir(25478, 'Insert'), 265108, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_INSCR', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 479300123339227584, 'O', null, 'Date inscription', 14, sie$migrt$pkg.obten_var_page_ir(25536, 'Insert'), 265222, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_NATR_TACHE_FORMT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 486034219560213597, 'O', null, 'Nature', 21, sie$migrt$pkg.obten_var_page_ir(25536, 'Insert'), 265273, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT_FORMT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 486034338406213598, 'O', null, 'Produit', 22, sie$migrt$pkg.obten_var_page_ir(25536, 'Insert'), 265274, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456665924366694157, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25456, 'Insert'), 265073, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_EQUIP_FORMT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456666048204694158, 'O', null, 'Équipe', 2, sie$migrt$pkg.obten_var_page_ir(25456, 'Insert'), 265074, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DEBUT_EFECT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456666225777694158, 'O', null, 'Début effectivité', 4, sie$migrt$pkg.obten_var_page_ir(25456, 'Insert'), 265075, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('FIN_EFECT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456666319564694158, 'O', null, 'Fin effectivité', 5, sie$migrt$pkg.obten_var_page_ir(25456, 'Insert'), 265076, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('POURC_AFECT_EQUIP_JALON', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456666449024694158, 'O', null, 'Pourcentage affecté', 6, sie$migrt$pkg.obten_var_page_ir(25456, 'Insert'), 265077, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STAT_REALS', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533564440395110972, 'O', null, 'Ref Stat Reals', 10, sie$migrt$pkg.obten_var_page_ir(25696, 'Insert'), 265663, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456604726227000102, 'O', null, 'Nom', 4, sie$migrt$pkg.obten_var_page_ir(25417, 'Insert'), 265053, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS_FORMT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456881834660813370, 'O', null, 'Utilisateur', 6, sie$migrt$pkg.obten_var_page_ir(25516, 'Insert'), 265153, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456902423851104448, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25536, 'Insert'), 265154, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_SIGNF', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456902541441104448, 'O', null, 'Numéro', 2, sie$migrt$pkg.obten_var_page_ir(25536, 'Insert'), 265155, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456902723966104449, 'O', null, 'Nom', 4, sie$migrt$pkg.obten_var_page_ir(25536, 'Insert'), 265157, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_ENVIR_FORMT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456903420186104451, 'O', null, 'Environnement', 11, sie$migrt$pkg.obten_var_page_ir(25536, 'Insert'), 265164, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_PRIOR_FORMT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456903528923104451, 'O', null, 'Priorité', 12, sie$migrt$pkg.obten_var_page_ir(25536, 'Insert'), 265165, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STAT_FORMT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456903633911104451, 'O', null, 'Statut', 13, sie$migrt$pkg.obten_var_page_ir(25536, 'Insert'), 265166, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456630419351618337, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25436, 'Insert'), 265054, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456630545061618338, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(25436, 'Insert'), 265055, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456630628450618340, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(25436, 'Insert'), 265056, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456846724906257114, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25516, 'Insert'), 265133, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_ROLE', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456846837944257115, 'O', null, 'Ref Role', 2, sie$migrt$pkg.obten_var_page_ir(25516, 'Insert'), 265134, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456846927031257115, 'O', null, 'Ref Utils', 3, sie$migrt$pkg.obten_var_page_ir(25516, 'Insert'), 265135, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DEBUT_EFECT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456847049296257115, 'O', null, 'Début effectivité', 4, sie$migrt$pkg.obten_var_page_ir(25516, 'Insert'), 265136, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('FIN_EFECT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456847127458257115, 'O', null, 'Fin effectivité', 5, sie$migrt$pkg.obten_var_page_ir(25516, 'Insert'), 265137, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_SIGNF', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 532983847431719386, 'O', null, 'Numéro', 2, sie$migrt$pkg.obten_var_page_ir(25696, 'Insert'), 265423, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 532983933484719386, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(25696, 'Insert'), 265424, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_ENVIR_FORMT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 532984022677719386, 'O', null, 'Environnement', 4, sie$migrt$pkg.obten_var_page_ir(25696, 'Insert'), 265425, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT_FORMT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 532984134125719387, 'O', null, 'Produit', 5, sie$migrt$pkg.obten_var_page_ir(25696, 'Insert'), 265426, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_NATR_TACHE_FORMT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 532984222612719388, 'O', null, 'Nature ', 6, sie$migrt$pkg.obten_var_page_ir(25696, 'Insert'), 265427, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_PRIOR_FORMT', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 532984321187719388, 'O', null, 'Priorité', 7, sie$migrt$pkg.obten_var_page_ir(25696, 'Insert'), 265428, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_PRIOR', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 532998931021736655, 'O', null, 'Ref Dv Prior', 8, sie$migrt$pkg.obten_var_page_ir(25696, 'Insert'), 265429, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 532999641167872100, 'O', null, 'Ref Utils', 9, sie$migrt$pkg.obten_var_page_ir(25696, 'Insert'), 265430, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 532983727436719382, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25696, 'Insert'), 265422, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456613147364082191, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25416, 'Insert'), 265033, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456613241608082192, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(25416, 'Insert'), 265034, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456613331618082192, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(25416, 'Insert'), 265035, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456613441886082192, 'O', null, 'Description', 4, sie$migrt$pkg.obten_var_page_ir(25416, 'Insert'), 265036, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456603039842955400, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25417, 'Insert'), 265038, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_PREVU', sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456603247432955401, 'O', null, 'Date prévue', 3, sie$migrt$pkg.obten_var_page_ir(25417, 'Insert'), 265040, null);
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
select seqnc into sie$migrt$pkg.var_page_ir_coln(265093) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25476, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265094) from sie_13_page_ir_coln where coln_table = 'REF_EQUIP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25476, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265095) from sie_13_page_ir_coln where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25476, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265096) from sie_13_page_ir_coln where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25476, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265097) from sie_13_page_ir_coln where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25476, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265098) from sie_13_page_ir_coln where coln_table = 'POURC_IMPLI_EQUIP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25476, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265099) from sie_13_page_ir_coln where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25476, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265100) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25477, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265101) from sie_13_page_ir_coln where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25477, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265102) from sie_13_page_ir_coln where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25477, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265103) from sie_13_page_ir_coln where coln_table = 'EFORT_DISPN_SEMN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25477, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265104) from sie_13_page_ir_coln where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25477, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265105) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25478, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265106) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25478, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265107) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25478, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265108) from sie_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25478, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265222) from sie_13_page_ir_coln where coln_table = 'DATE_INSCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265273) from sie_13_page_ir_coln where coln_table = 'REF_NATR_TACHE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265274) from sie_13_page_ir_coln where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265073) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25456, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265074) from sie_13_page_ir_coln where coln_table = 'REF_EQUIP_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25456, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265075) from sie_13_page_ir_coln where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25456, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265076) from sie_13_page_ir_coln where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25456, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265077) from sie_13_page_ir_coln where coln_table = 'POURC_AFECT_EQUIP_JALON' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25456, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265663) from sie_13_page_ir_coln where coln_table = 'REF_STAT_REALS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265053) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25417, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265153) from sie_13_page_ir_coln where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25516, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265154) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265155) from sie_13_page_ir_coln where coln_table = 'NUMR_SIGNF' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265157) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265164) from sie_13_page_ir_coln where coln_table = 'REF_ENVIR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265165) from sie_13_page_ir_coln where coln_table = 'REF_DV_PRIOR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265166) from sie_13_page_ir_coln where coln_table = 'REF_STAT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265054) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25436, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265055) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25436, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265056) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25436, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265133) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25516, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265134) from sie_13_page_ir_coln where coln_table = 'REF_ROLE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25516, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265135) from sie_13_page_ir_coln where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25516, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265136) from sie_13_page_ir_coln where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25516, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265137) from sie_13_page_ir_coln where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25516, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265423) from sie_13_page_ir_coln where coln_table = 'NUMR_SIGNF' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265424) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265425) from sie_13_page_ir_coln where coln_table = 'REF_ENVIR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265426) from sie_13_page_ir_coln where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265427) from sie_13_page_ir_coln where coln_table = 'REF_NATR_TACHE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265428) from sie_13_page_ir_coln where coln_table = 'REF_DV_PRIOR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265429) from sie_13_page_ir_coln where coln_table = 'REF_DV_PRIOR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265430) from sie_13_page_ir_coln where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265422) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265033) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25416, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265034) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25416, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265035) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25416, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265036) from sie_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25416, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265038) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25417, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265040) from sie_13_page_ir_coln where coln_table = 'DATE_PREVU' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25417, 'Select');
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

insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 529448821260849714, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITER', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585674, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533009821953419858, 'O', null, null, null, null, 'O', null, 'Numéro', 'P1056_NUMR_SIGNF', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585614, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533010026866419861, 'O', null, null, null, null, 'O', null, 'Nom', 'P1056_NOM', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585615, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533010244450419861, 'O', null, null, null, null, 'O', null, 'Description', 'P1056_DESCR', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585616, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533010427815419862, 'O', null, null, null, null, 'O', null, 'Priorité', 'P1056_REF_DV_PRIOR', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585617, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533010624826419862, 'O', null, null, null, null, 'O', null, 'Statut', 'P1056_REF_STAT', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585618, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533010844224419862, 'O', null, null, null, null, 'O', null, 'Commentaire', 'P1056_COMNT', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585619, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533011041359419863, 'O', null, null, null, null, 'N', null, 'Complexité', 'P1056_REF_DV_COMPL', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585620, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533011242380419863, 'O', null, null, null, null, 'O', null, 'Date inscription', 'P1056_DATE_INSCR', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585621, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533011432112419863, 'O', null, null, null, null, 'N', null, 'Jalon', 'P1056_REF_JALON', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585622, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533011649461419864, 'O', null, null, null, null, 'O', null, 'Nature de la tâche', 'P1056_REF_NATR_TACHE', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585623, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533012643215419869, 'O', null, null, null, null, 'O', null, 'Environnement', 'P1056_REF_ENVIR', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585625, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533012829108419869, 'O', null, null, null, null, 'O', null, 'Produit', 'P1056_REF_PRODT', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585626, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533015048123419875, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1056_SEQNC', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585627, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 485937428808966829, 'O', null, null, null, null, 'N', null, 'Date inscription', 'P1052_DATE_INSCR', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 585148, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533015232086419876, 'O', null, null, null, null, 'N', null, '[P1056_PLANIF_EFORT]', 'P1056_PLANIF_EFORT', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585628, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 485942720441210381, 'O', null, null, null, null, 'O', null, 'Nature de la tâche', 'P1052_REF_NATR_TACHE', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 585152, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 529431324720111424, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585631, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 485944139797263209, 'O', null, null, null, null, 'O', null, 'Produit', 'P1052_REF_PRODT', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 585154, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 529431527620111425, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585632, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 529431706585111425, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585633, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 529431908869111425, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 585634, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1262400684601292385, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SUBMIT', sie$migrt$pkg.obten_var_page(11806, 'Insert'), 99428, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456848419190316916, 'O', null, null, null, null, 'N', null, '[P1042_ROLE_UTILS]', 'P1042_ROLE_UTILS', sie$migrt$pkg.obten_var_page(52804, 'Insert'), 584748, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453266413933031103, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREER_ROLE_UTILS', sie$migrt$pkg.obten_var_page(52804, 'Insert'), 584749, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1526270456949481907, 'O', null, null, null, null, 'N', null, '[SADA]', 'SADA', sie$migrt$pkg.obten_var_page(11803, 'Insert'), 99388, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1555815456232562815, 'O', null, null, null, null, 'N', null, 'Test', 'SIDF', sie$migrt$pkg.obten_var_page(11803, 'Insert'), 99389, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1555815683706562817, 'O', null, null, null, null, 'N', null, '[SSPC]', 'SSPC', sie$migrt$pkg.obten_var_page(11803, 'Insert'), 99390, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1555815858696562817, 'O', null, null, null, null, 'N', null, '[SCPC]', 'SCPC', sie$migrt$pkg.obten_var_page(11803, 'Insert'), 99391, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1556154677118182298, 'O', null, null, null, null, 'N', null, '[SAPC]', 'SAPC', sie$migrt$pkg.obten_var_page(11803, 'Insert'), 99392, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1577639161109238962, 'O', null, null, null, null, 'N', null, 'SNPI', 'SNPI', sie$migrt$pkg.obten_var_page(11803, 'Insert'), 99393, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1600379477506406595, 'O', null, null, null, null, 'N', null, '[SCPI]', 'SCPI', sie$migrt$pkg.obten_var_page(11803, 'Insert'), 99394, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1600379682701408118, 'O', null, null, null, null, 'N', null, '[SSPI]', 'SSPI', sie$migrt$pkg.obten_var_page(11803, 'Insert'), 99395, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1600379887549409465, 'O', null, null, null, null, 'N', null, '[SAPI]', 'SAPI', sie$migrt$pkg.obten_var_page(11803, 'Insert'), 99396, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1672093221206470408, 'O', null, null, null, null, 'N', null, '[P0_RECHR_GLOBL]', 'P0_RECHR_GLOBL', sie$migrt$pkg.obten_var_page(11803, 'Insert'), 99397, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1526569236949039059, 'O', null, null, null, null, 'N', null, 'Code d''utilisateur', 'P101_CODE_UTILS', sie$migrt$pkg.obten_var_page(11804, 'Insert'), 99398, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1526569445333039060, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P101_MOT_PASSE', sie$migrt$pkg.obten_var_page(11804, 'Insert'), 99399, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1526569634664039060, 'O', null, null, null, null, 'N', null, 'Connexion', 'P101_LOGIN', sie$migrt$pkg.obten_var_page(11804, 'Insert'), 99400, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1526569837217039060, 'O', null, null, null, null, 'N', null, 'Domaine', 'P101_DOMN', sie$migrt$pkg.obten_var_page(11804, 'Insert'), 99401, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1526570037181039061, 'O', null, null, null, null, 'N', null, '[P101_LANG]', 'P101_LANG', sie$migrt$pkg.obten_var_page(11804, 'Insert'), 99402, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1526570230662039061, 'O', null, null, null, null, 'N', null, '[P101_FORCE_DOMN]', 'P101_FORCE_DOMN', sie$migrt$pkg.obten_var_page(11804, 'Insert'), 99403, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1929810544890374428, 'O', null, null, null, null, 'N', null, 'Application:', 'P102_APPLICATION_ID', sie$migrt$pkg.obten_var_page(11806, 'Insert'), 99404, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1929811048714374431, 'O', null, null, null, null, 'N', null, 'Page:', 'P102_PAGE_ID', sie$migrt$pkg.obten_var_page(11806, 'Insert'), 99405, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1929811528641374431, 'O', null, null, null, null, 'N', null, '[P102_A]', 'P102_A', sie$migrt$pkg.obten_var_page(11806, 'Insert'), 99406, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1929811745567374432, 'O', null, null, null, null, 'N', null, 'Commentaire', 'P102_FEEDBACK', sie$migrt$pkg.obten_var_page(11806, 'Insert'), 99407, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1929812243662374433, 'O', null, null, null, null, 'N', null, '[P102_X]', 'P102_X', sie$migrt$pkg.obten_var_page(11806, 'Insert'), 99408, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1929812451604374433, 'O', null, null, null, null, 'N', null, 'Type de commentaire', 'P102_FEEDBACK_TYPE', sie$migrt$pkg.obten_var_page(11806, 'Insert'), 99409, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 1929812951375374433, 'O', null, null, null, null, 'N', null, '[P102_Y]', 'P102_Y', sie$migrt$pkg.obten_var_page(11806, 'Insert'), 99410, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 486806641102875421, 'O', null, null, null, null, 'N', null, 'Complexité', 'P1052_REF_DV_COMPL', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 585260, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 486911323064087529, 'O', null, null, null, null, 'N', null, '[P1052_PLANIF_EFORT]', 'P1052_PLANIF_EFORT', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 585261, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 483354329336287519, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITER_AFECT', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 585262, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 483321628205530330, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITER_PLANIF_EFORT', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 585263, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 483379606561163082, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SUBMIT', sie$migrt$pkg.obten_var_page(53163, 'Insert'), 585264, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 483379531770163082, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(53163, 'Insert'), 585265, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 483379803047163082, 'N', null, null, null, null, 'N', null, 'Ajouter', 'ADD', sie$migrt$pkg.obten_var_page(53163, 'Insert'), 585266, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456600848134955374, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1022_SEQNC', sie$migrt$pkg.obten_var_page(52704, 'Insert'), 584568, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456601018129955381, 'O', null, null, null, null, 'O', null, 'Nom', 'P1022_NOM', sie$migrt$pkg.obten_var_page(52704, 'Insert'), 584569, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456601224925955382, 'O', null, null, null, null, 'O', null, '[P1022_REF_PRODT]', 'P1022_REF_PRODT', sie$migrt$pkg.obten_var_page(52704, 'Insert'), 584570, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456601437732955382, 'O', null, null, null, null, 'O', null, 'Date prévue', 'P1022_DATE_PREVU', sie$migrt$pkg.obten_var_page(52704, 'Insert'), 584571, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453016923090646910, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(52704, 'Insert'), 584572, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453016709197646910, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(52704, 'Insert'), 584573, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453016611514646910, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(52704, 'Insert'), 584574, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453016509512646910, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(52704, 'Insert'), 584575, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453020922802646956, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(52705, 'Insert'), 584576, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 533572518988634574, 'O', null, null, null, null, 'O', null, 'Précision de réalisation', 'P1056_REF_STAT_REALS', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 586159, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 529984310109111121, 'N', null, null, null, null, 'N', null, 'Consulter', 'CONSULTER', sie$migrt$pkg.obten_var_page(53343, 'Insert'), 586160, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456695642594528611, 'O', null, null, null, null, 'N', null, '[P1022_JALON_EQUIP]', 'P1022_JALON_EQUIP', sie$migrt$pkg.obten_var_page(52704, 'Insert'), 584648, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456704419419749073, 'O', null, null, null, null, 'N', null, '[P1012_LIEN_EQUIP]', 'P1012_LIEN_EQUIP', sie$migrt$pkg.obten_var_page(52723, 'Insert'), 584649, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456691123445390704, 'O', null, null, null, null, 'O', null, '[P1013_REF_EQUIP]', 'P1013_REF_EQUIP', sie$migrt$pkg.obten_var_page(52743, 'Insert'), 584650, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456691922714437799, 'O', null, null, null, null, 'O', null, 'Utilisateur', 'P1013_REF_UTILS', sie$migrt$pkg.obten_var_page(52743, 'Insert'), 584651, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456692525270447998, 'O', null, null, null, null, 'O', null, 'Date début effectif', 'P1013_DEBUT_EFECT', sie$migrt$pkg.obten_var_page(52743, 'Insert'), 584652, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456690931971383727, 'O', null, null, null, null, 'O', null, '[P1013_SEQNC]', 'P1013_SEQNC', sie$migrt$pkg.obten_var_page(52743, 'Insert'), 584653, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456692718821455555, 'O', null, null, null, null, 'O', null, 'Date fin effectif', 'P1013_FIN_EFECT', sie$migrt$pkg.obten_var_page(52743, 'Insert'), 584654, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456693128995467941, 'O', null, null, null, null, 'O', null, 'Pourcentage d''implication', 'P1013_POURC_IMPLI_EQUIP', sie$migrt$pkg.obten_var_page(52743, 'Insert'), 584655, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453098019657736236, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(52743, 'Insert'), 584656, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453099325245766291, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(52743, 'Insert'), 584657, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453107211514046104, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(52743, 'Insert'), 584658, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453107507621063928, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(52743, 'Insert'), 584659, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456702227637694630, 'O', null, null, null, null, 'O', null, 'Pourcentage affecté', 'P1023_POURC_AFECT_EQUIP_JALON', sie$migrt$pkg.obten_var_page(52744, 'Insert'), 584660, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456679018288991833, 'O', null, null, null, null, 'O', null, '[P1023_REF_JALON]', 'P1023_REF_JALON', sie$migrt$pkg.obten_var_page(52744, 'Insert'), 584661, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456681238337044917, 'O', null, null, null, null, 'O', null, '[P1023_SEQNC]', 'P1023_SEQNC', sie$migrt$pkg.obten_var_page(52744, 'Insert'), 584662, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456681730157052015, 'O', null, null, null, null, 'O', null, 'Début effectivité', 'P1023_DEBUT_EFEC', sie$migrt$pkg.obten_var_page(52744, 'Insert'), 584663, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456681942277055513, 'O', null, null, null, null, 'O', null, 'Fin effectivité', 'P1023_FIN_EFECT', sie$migrt$pkg.obten_var_page(52744, 'Insert'), 584664, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456682634490091113, 'O', null, null, null, null, 'O', null, 'Équipe', 'P1023_REF_EQUIP', sie$migrt$pkg.obten_var_page(52744, 'Insert'), 584665, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453093626050624590, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(52744, 'Insert'), 584666, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453093925489633922, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(52744, 'Insert'), 584667, 'BOUTN');
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
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453094324927643248, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(52744, 'Insert'), 584668, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453095208089647752, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(52744, 'Insert'), 584669, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456772830630578836, 'O', null, null, null, null, 'N', null, '[P1031_DISPN_UTILS]', 'P1031_DISPN_UTILS', sie$migrt$pkg.obten_var_page(52783, 'Insert'), 584670, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453183915405093263, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREATE', sie$migrt$pkg.obten_var_page(52783, 'Insert'), 584671, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456796643807434129, 'O', null, null, null, null, 'O', null, 'Utilisateur', 'P1032_REF_UTILS', sie$migrt$pkg.obten_var_page(52784, 'Insert'), 584672, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456763639232401682, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1032_SEQNC', sie$migrt$pkg.obten_var_page(52784, 'Insert'), 584673, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456764226065401692, 'O', null, null, null, null, 'O', null, 'Début effectivitée', 'P1032_DEBUT_EFECT', sie$migrt$pkg.obten_var_page(52784, 'Insert'), 584674, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456764435406401692, 'O', null, null, null, null, 'O', null, 'Effort disponible', 'P1032_EFORT_DISPN_SEMN', sie$migrt$pkg.obten_var_page(52784, 'Insert'), 584675, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456764634476401692, 'O', null, null, null, null, 'O', null, 'Date début effectivitée', 'P1032_FIN_EFECT', sie$migrt$pkg.obten_var_page(52784, 'Insert'), 584676, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453179605616093230, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(52784, 'Insert'), 584677, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453179428170093230, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(52784, 'Insert'), 584678, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453179300461093230, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(52784, 'Insert'), 584679, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453179232342093230, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(52784, 'Insert'), 584680, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453222218032282718, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(52803, 'Insert'), 584681, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456802431386591143, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1042_SEQNC', sie$migrt$pkg.obten_var_page(52804, 'Insert'), 584682, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456802632555591151, 'O', null, null, null, null, 'O', null, 'Code', 'P1042_CODE', sie$migrt$pkg.obten_var_page(52804, 'Insert'), 584683, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456802821128591152, 'O', null, null, null, null, 'O', null, 'Nom', 'P1042_NOM', sie$migrt$pkg.obten_var_page(52804, 'Insert'), 584684, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456803031294591152, 'O', null, null, null, null, 'O', null, 'Description', 'P1042_DESCR', sie$migrt$pkg.obten_var_page(52804, 'Insert'), 584685, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453218401688282688, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(52804, 'Insert'), 584686, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453218200548282688, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(52804, 'Insert'), 584687, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453218126000282688, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(52804, 'Insert'), 584688, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453218029888282688, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(52804, 'Insert'), 584689, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 488769730767881068, 'O', null, null, null, null, 'N', null, 'Jalon', 'P1052_REF_JALON', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 585594, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 510280222891290485, 'O', null, null, null, null, 'N', null, '[P1052_AFECT]', 'P1052_AFECT', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 585595, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 487119232249771153, 'O', null, null, null, null, 'O', null, 'Rôle', 'P1054_REF_ROLE_FORMT', sie$migrt$pkg.obten_var_page(53163, 'Insert'), 585596, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 487120522253796591, 'O', null, null, null, null, 'N', null, 'Ajouter', 'P1054_AJOUTER', sie$migrt$pkg.obten_var_page(53163, 'Insert'), 585597, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453086032349456133, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREER_JALON_EQUIP', sie$migrt$pkg.obten_var_page(52704, 'Insert'), 584608, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453087218067470956, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREER_LIEN_EQUIP', sie$migrt$pkg.obten_var_page(52723, 'Insert'), 584609, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 487147323918667427, 'O', null, null, null, null, 'O', null, '[P1053_SEQNC]', 'P1053_SEQNC', sie$migrt$pkg.obten_var_page(52923, 'Insert'), 584890, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 487145247485475576, 'O', null, null, null, null, 'O', null, 'Utilisateurs', 'P1053_REF_UTILS', sie$migrt$pkg.obten_var_page(52923, 'Insert'), 584893, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453477800247562723, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(52923, 'Insert'), 584896, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453477510045562723, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(52923, 'Insert'), 584898, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453030800639773745, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(52703, 'Insert'), 584588, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456610638012082171, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1012_SEQNC', sie$migrt$pkg.obten_var_page(52723, 'Insert'), 584589, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456610827753082180, 'O', null, null, null, null, 'O', null, 'Code', 'P1012_CODE', sie$migrt$pkg.obten_var_page(52723, 'Insert'), 584590, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456611028177082181, 'O', null, null, null, null, 'O', null, 'Nom', 'P1012_NOM', sie$migrt$pkg.obten_var_page(52723, 'Insert'), 584591, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456611221099082181, 'O', null, null, null, null, 'O', null, 'Description', 'P1012_DESCR', sie$migrt$pkg.obten_var_page(52723, 'Insert'), 584592, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453026615784773718, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(52723, 'Insert'), 584593, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453026416313773718, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(52723, 'Insert'), 584594, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453026317409773718, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(52723, 'Insert'), 584595, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453026207016773718, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(52723, 'Insert'), 584596, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456871046500646537, 'O', null, null, null, null, 'O', null, '[P1043_SEQNC]', 'P1043_SEQNC', sie$migrt$pkg.obten_var_page(52823, 'Insert'), 584768, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456871438320653640, 'O', null, null, null, null, 'O', null, '[P1043_REF_ROLE]', 'P1043_REF_ROLE', sie$migrt$pkg.obten_var_page(52823, 'Insert'), 584769, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456873735166699972, 'O', null, null, null, null, 'O', null, 'Utilisateur', 'P1043_REF_UTILS', sie$migrt$pkg.obten_var_page(52823, 'Insert'), 584770, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456874230926717688, 'O', null, null, null, null, 'O', null, 'Date début effectif', 'P1043_DEBUT_EFECT', sie$migrt$pkg.obten_var_page(52823, 'Insert'), 584771, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456874433481727899, 'O', null, null, null, null, 'O', null, 'Date fin effectif', 'P1043_FIN_EFECT', sie$migrt$pkg.obten_var_page(52823, 'Insert'), 584772, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453286705612303102, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(52823, 'Insert'), 584773, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453287418556316304, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(52823, 'Insert'), 584774, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453287731154329400, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(52823, 'Insert'), 584775, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453284129591291116, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(52823, 'Insert'), 584776, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456897330602104422, 'O', null, null, null, null, 'O', null, 'Numéro', 'P1052_NUMR_SIGNF', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 584777, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456897730270104424, 'O', null, null, null, null, 'O', null, 'Nom', 'P1052_NOM', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 584779, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456897941653104424, 'O', null, null, null, null, 'O', null, 'Description', 'P1052_DESCR', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 584780, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456897136743104413, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1052_SEQNC', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 584784, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456899122852104428, 'O', null, null, null, null, 'O', null, 'Environnement', 'P1052_REF_ENVIR', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 584786, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456899338930104428, 'O', null, null, null, null, 'O', null, 'Priorité', 'P1052_REF_DV_PRIOR', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 584787, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456899531811104428, 'O', null, null, null, null, 'O', null, 'Statut', 'P1052_REF_STAT', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 584788, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 456899750186104429, 'O', null, null, null, null, 'O', null, 'Commentaire', 'P1052_COMNT', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 584789, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453312932508795955, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 584791, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453313108711795955, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 584792, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453312832067795955, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 584793, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453312707860795955, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(52843, 'Insert'), 584794, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(59, 'Insert'), 453321028221796006, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(52844, 'Insert'), 584795, 'BOUTN');
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
select seqnc into sie$migrt$pkg.var_page_item(585674) from sie_13_page_item where nom_apex = 'EDITER' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585614) from sie_13_page_item where nom_apex = 'P1056_NUMR_SIGNF' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585615) from sie_13_page_item where nom_apex = 'P1056_NOM' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585616) from sie_13_page_item where nom_apex = 'P1056_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585617) from sie_13_page_item where nom_apex = 'P1056_REF_DV_PRIOR' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585618) from sie_13_page_item where nom_apex = 'P1056_REF_STAT' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585619) from sie_13_page_item where nom_apex = 'P1056_COMNT' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585620) from sie_13_page_item where nom_apex = 'P1056_REF_DV_COMPL' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585621) from sie_13_page_item where nom_apex = 'P1056_DATE_INSCR' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585622) from sie_13_page_item where nom_apex = 'P1056_REF_JALON' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585623) from sie_13_page_item where nom_apex = 'P1056_REF_NATR_TACHE' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585625) from sie_13_page_item where nom_apex = 'P1056_REF_ENVIR' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585626) from sie_13_page_item where nom_apex = 'P1056_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585627) from sie_13_page_item where nom_apex = 'P1056_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585148) from sie_13_page_item where nom_apex = 'P1052_DATE_INSCR' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585628) from sie_13_page_item where nom_apex = 'P1056_PLANIF_EFORT' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585152) from sie_13_page_item where nom_apex = 'P1052_REF_NATR_TACHE' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585631) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585154) from sie_13_page_item where nom_apex = 'P1052_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585632) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585633) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585634) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99428) from sie_13_page_item where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584748) from sie_13_page_item where nom_apex = 'P1042_ROLE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584749) from sie_13_page_item where nom_apex = 'CREER_ROLE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99388) from sie_13_page_item where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99389) from sie_13_page_item where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99390) from sie_13_page_item where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99391) from sie_13_page_item where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99392) from sie_13_page_item where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99393) from sie_13_page_item where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99394) from sie_13_page_item where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99395) from sie_13_page_item where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99396) from sie_13_page_item where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99397) from sie_13_page_item where nom_apex = 'P0_RECHR_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99398) from sie_13_page_item where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(11804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99399) from sie_13_page_item where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(11804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99400) from sie_13_page_item where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(11804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99401) from sie_13_page_item where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(11804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99402) from sie_13_page_item where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(11804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99403) from sie_13_page_item where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(11804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99404) from sie_13_page_item where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99405) from sie_13_page_item where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99406) from sie_13_page_item where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99407) from sie_13_page_item where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99408) from sie_13_page_item where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99409) from sie_13_page_item where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(99410) from sie_13_page_item where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585260) from sie_13_page_item where nom_apex = 'P1052_REF_DV_COMPL' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585261) from sie_13_page_item where nom_apex = 'P1052_PLANIF_EFORT' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585262) from sie_13_page_item where nom_apex = 'EDITER_AFECT' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585263) from sie_13_page_item where nom_apex = 'EDITER_PLANIF_EFORT' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585264) from sie_13_page_item where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(53163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585265) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585266) from sie_13_page_item where nom_apex = 'ADD' and ref_page = sie$migrt$pkg.obten_var_page(53163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584568) from sie_13_page_item where nom_apex = 'P1022_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584569) from sie_13_page_item where nom_apex = 'P1022_NOM' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584570) from sie_13_page_item where nom_apex = 'P1022_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584571) from sie_13_page_item where nom_apex = 'P1022_DATE_PREVU' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584572) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584573) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584574) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584575) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584576) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52705, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(586159) from sie_13_page_item where nom_apex = 'P1056_REF_STAT_REALS' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(586160) from sie_13_page_item where nom_apex = 'CONSULTER' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584648) from sie_13_page_item where nom_apex = 'P1022_JALON_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584649) from sie_13_page_item where nom_apex = 'P1012_LIEN_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584650) from sie_13_page_item where nom_apex = 'P1013_REF_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584651) from sie_13_page_item where nom_apex = 'P1013_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584652) from sie_13_page_item where nom_apex = 'P1013_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584653) from sie_13_page_item where nom_apex = 'P1013_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584654) from sie_13_page_item where nom_apex = 'P1013_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584655) from sie_13_page_item where nom_apex = 'P1013_POURC_IMPLI_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584656) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584657) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584658) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584659) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584660) from sie_13_page_item where nom_apex = 'P1023_POURC_AFECT_EQUIP_JALON' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584661) from sie_13_page_item where nom_apex = 'P1023_REF_JALON' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584662) from sie_13_page_item where nom_apex = 'P1023_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584663) from sie_13_page_item where nom_apex = 'P1023_DEBUT_EFEC' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584664) from sie_13_page_item where nom_apex = 'P1023_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584665) from sie_13_page_item where nom_apex = 'P1023_REF_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584666) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584667) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
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
select seqnc into sie$migrt$pkg.var_page_item(584668) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584669) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584670) from sie_13_page_item where nom_apex = 'P1031_DISPN_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52783, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584671) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52783, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584672) from sie_13_page_item where nom_apex = 'P1032_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584673) from sie_13_page_item where nom_apex = 'P1032_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584674) from sie_13_page_item where nom_apex = 'P1032_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584675) from sie_13_page_item where nom_apex = 'P1032_EFORT_DISPN_SEMN' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584676) from sie_13_page_item where nom_apex = 'P1032_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584677) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584678) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584679) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584680) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584681) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52803, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584682) from sie_13_page_item where nom_apex = 'P1042_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584683) from sie_13_page_item where nom_apex = 'P1042_CODE' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584684) from sie_13_page_item where nom_apex = 'P1042_NOM' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584685) from sie_13_page_item where nom_apex = 'P1042_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584686) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584687) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584688) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584689) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585594) from sie_13_page_item where nom_apex = 'P1052_REF_JALON' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585595) from sie_13_page_item where nom_apex = 'P1052_AFECT' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585596) from sie_13_page_item where nom_apex = 'P1054_REF_ROLE_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(53163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585597) from sie_13_page_item where nom_apex = 'P1054_AJOUTER' and ref_page = sie$migrt$pkg.obten_var_page(53163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584608) from sie_13_page_item where nom_apex = 'CREER_JALON_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584609) from sie_13_page_item where nom_apex = 'CREER_LIEN_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584890) from sie_13_page_item where nom_apex = 'P1053_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52923, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584893) from sie_13_page_item where nom_apex = 'P1053_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52923, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584896) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52923, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584898) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52923, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584588) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52703, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584589) from sie_13_page_item where nom_apex = 'P1012_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584590) from sie_13_page_item where nom_apex = 'P1012_CODE' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584591) from sie_13_page_item where nom_apex = 'P1012_NOM' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584592) from sie_13_page_item where nom_apex = 'P1012_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584593) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584594) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584595) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584596) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584768) from sie_13_page_item where nom_apex = 'P1043_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584769) from sie_13_page_item where nom_apex = 'P1043_REF_ROLE' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584770) from sie_13_page_item where nom_apex = 'P1043_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584771) from sie_13_page_item where nom_apex = 'P1043_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584772) from sie_13_page_item where nom_apex = 'P1043_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584773) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584774) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584775) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584776) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584777) from sie_13_page_item where nom_apex = 'P1052_NUMR_SIGNF' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584779) from sie_13_page_item where nom_apex = 'P1052_NOM' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584780) from sie_13_page_item where nom_apex = 'P1052_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584784) from sie_13_page_item where nom_apex = 'P1052_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584786) from sie_13_page_item where nom_apex = 'P1052_REF_ENVIR' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584787) from sie_13_page_item where nom_apex = 'P1052_REF_DV_PRIOR' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584788) from sie_13_page_item where nom_apex = 'P1052_REF_STAT' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584789) from sie_13_page_item where nom_apex = 'P1052_COMNT' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584791) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584792) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584793) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584794) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584795) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52844, 'Select');
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
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14502, 'Update') where numr_apex = 1041 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14502, 'Update') where numr_apex = 1042 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2862, 'Update') where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2342, 'Update') where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(13165, 'Update') where numr_apex = 1001 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14582, 'Update') where numr_apex = 1052 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14582, 'Update') where numr_apex = 1051 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1054 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14602, 'Update') where numr_apex = 1053 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14562, 'Update') where numr_apex = 1043 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14462, 'Update') where numr_apex = 1013 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14442, 'Update') where numr_apex = 1023 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14582, 'Update') where numr_apex = 1055 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14423, 'Update') where numr_apex = 1011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14422, 'Update') where numr_apex = 1022 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14422, 'Update') where numr_apex = 1021 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14542, 'Update') where numr_apex = 1031 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14542, 'Update') where numr_apex = 1032 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14582, 'Update') where numr_apex = 1056 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14423, 'Update') where numr_apex = 1012 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 2 and ref_aplic = sie$migrt$pkg.obten_var_aplic(59, 'Select');
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
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25476, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_EQUIP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25476, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25476, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25476, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25476, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'POURC_IMPLI_EQUIP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25476, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25476, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25477, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25477, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25477, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'EFORT_DISPN_SEMN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25477, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25477, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25478, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25478, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25478, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25478, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_INSCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_NATR_TACHE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25456, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_EQUIP_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25456, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25456, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25456, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'POURC_AFECT_EQUIP_JALON' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25456, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STAT_REALS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25417, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25516, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_SIGNF' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_ENVIR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_PRIOR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STAT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25536, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25436, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25436, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25436, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25516, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_ROLE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25516, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25516, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25516, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25516, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_SIGNF' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_ENVIR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_NATR_TACHE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_PRIOR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_PRIOR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25696, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25416, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25416, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25416, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25416, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25417, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_PREVU' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25417, 'Select');
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
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITER' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_NUMR_SIGNF' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_NOM' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_DV_PRIOR' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_STAT' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_COMNT' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_DV_COMPL' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_DATE_INSCR' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_JALON' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_NATR_TACHE' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_ENVIR' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_DATE_INSCR' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_PLANIF_EFORT' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_NATR_TACHE' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_ROLE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER_ROLE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P0_RECHR_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(11803, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(11804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(11804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(11804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(11804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(11804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(11804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(11806, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_DV_COMPL' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_PLANIF_EFORT' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITER_AFECT' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITER_PLANIF_EFORT' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(53163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'ADD' and ref_page = sie$migrt$pkg.obten_var_page(53163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_NOM' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_DATE_PREVU' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52705, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_STAT_REALS' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CONSULTER' and ref_page = sie$migrt$pkg.obten_var_page(53343, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_JALON_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_LIEN_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_REF_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_POURC_IMPLI_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52743, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_POURC_AFECT_EQUIP_JALON' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_REF_JALON' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_DEBUT_EFEC' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_REF_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
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
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52744, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1031_DISPN_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52783, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52783, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_EFORT_DISPN_SEMN' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52784, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52803, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_CODE' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_NOM' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52804, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_JALON' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_AFECT' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1054_REF_ROLE_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(53163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1054_AJOUTER' and ref_page = sie$migrt$pkg.obten_var_page(53163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER_JALON_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(52704, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER_LIEN_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1053_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52923, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1053_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52923, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52923, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52923, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52703, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_CODE' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_NOM' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52723, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1043_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1043_REF_ROLE' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1043_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1043_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1043_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52823, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_NUMR_SIGNF' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_NOM' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_ENVIR' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_DV_PRIOR' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_STAT' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_COMNT' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52843, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52844, 'Select');
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
                       set ref_versn = sie$migrt$pkg.obten_var_versn(1042, 'Update'),
                           indic_aplic_authe = 'O',
                           ref_aplic_authe = sie$migrt$pkg.obten_var_aplic(5, 'Update'),
                           ref_page_conxn = sie$migrt$pkg.obten_var_page(11804, 'Update')
                     where seqnc = sie$migrt$pkg.obten_var_aplic(59);
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_aplic');
end;
/
begin
  if sie$migrt$pkg.vnu_sql_code = 0 then
    dbms_output.put_line ('Mise a jour du referentiel pour application : SAFM - SIE APEX Framework - Méthodologie');
    sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(59),'O');
  end if;
end;
/

