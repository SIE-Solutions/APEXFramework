alter session set current_schema = apex_040200;

CREATE OR REPLACE TRIGGER APEX_IR_RPTS_ASIU_TRG
  before insert or update
  ON APEX_040200.WWV_FLOW_WORKSHEET_RPTS
  for each row
declare
  type typ_tri is record (
                    coln wwv_flow_worksheet_rpts.sort_column_1%type,
                    dirct wwv_flow_worksheet_rpts.sort_direction_1%type);

  type typ_ordre_tri is table of typ_tri
                         index by pls_integer;

  type typ_tab_tri_exist is table of pls_integer
                             index by wwv_flow_worksheet_rpts.sort_column_1%type;

  -- Tableau contenant les colonnes et direction de tri
  vtb_ordre_tri   typ_ordre_tri;

  -- Tableau servant à vérifier facilement si une colonne est déjà présente dans le tri
  vtb_tri_exist   typ_tab_tri_exist;

  vnu_index       pls_integer;

  -- Charge une colonne/direction dans le tableau
  procedure charg_ordre_tri (pva_coln_tri in out varchar2, pva_dirct_tri in varchar2) is
  begin
    if pva_coln_tri is not null then                                                 -- Ne pas charger si pas de colonne
      if pva_coln_tri like '%$AFF' then
        -- S'il s'agit d'une colonne d'affichage pour un tri alternatif
        -- la remplacer par la colonne de tri associée
        pva_coln_tri   :=
          substr (pva_coln_tri,
                  1,
                  length (pva_coln_tri) - 4) ||
          '$TRI';
      end if;

      -- Éviter les doublons
      if not vtb_tri_exist.exists (pva_coln_tri) then
        vtb_tri_exist (pva_coln_tri)      := 1;

        -- Charger la colonne dans le tableau de tri
        vnu_index                         := vnu_index + 1;
        vtb_ordre_tri (vnu_index).coln    := pva_coln_tri;
        vtb_ordre_tri (vnu_index).dirct   := pva_dirct_tri;
      end if;
    end if;
  end;

  -- Définit la prochaine colonne de tri
  procedure defnr_ordre_tri (pva_coln_tri out varchar2, pva_dirct_tri out varchar2) is
  begin
    if vnu_index is null then
      -- Il ne reste plus de colonne de tri, nullifier les champs
      pva_coln_tri    := null;
      pva_dirct_tri   := null;
    else
      -- Définir les champs avec l'index de tri en cours
      pva_coln_tri    := vtb_ordre_tri (vnu_index).coln;
      pva_dirct_tri   := vtb_ordre_tri (vnu_index).dirct;

      -- Passer au prochain tri
      vnu_index       := vtb_ordre_tri.next (vnu_index);
    end if;
  end;
begin
  -- Charger les 6 colonnes actuelles
  vnu_index   := 0;
  charg_ordre_tri (:new.sort_column_1,
                   :new.sort_direction_1);
  charg_ordre_tri (:new.sort_column_2,
                   :new.sort_direction_2);
  charg_ordre_tri (:new.sort_column_3,
                   :new.sort_direction_3);
  charg_ordre_tri (:new.sort_column_4,
                   :new.sort_direction_4);
  charg_ordre_tri (:new.sort_column_5,
                   :new.sort_direction_5);
  charg_ordre_tri (:new.sort_column_6,
                   :new.sort_direction_6);

  vnu_index   := vtb_ordre_tri.first ();
  defnr_ordre_tri (:new.sort_column_1,
                   :new.sort_direction_1);
  defnr_ordre_tri (:new.sort_column_2,
                   :new.sort_direction_2);
  defnr_ordre_tri (:new.sort_column_3,
                   :new.sort_direction_3);
  defnr_ordre_tri (:new.sort_column_4,
                   :new.sort_direction_4);
  defnr_ordre_tri (:new.sort_column_5,
                   :new.sort_direction_5);
  defnr_ordre_tri (:new.sort_column_6,
                   :new.sort_direction_6);
end;
/