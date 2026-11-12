select
    cd_societe || '|' || to_varchar(no_commande) as cle_commande,
    cd_societe || '|' || to_varchar(no_commande) || '|' || to_varchar(no_ligne)
        as cle_ligne_commande,
    cd_societe || '|' || cd_agence || '|' || cd_client as cle_client,
    upper(trim(ccirep)) as code_article,
    dt_creation as date_commande,
    dt_facturation as date_facturation,
    upper(trim(cd_situation_ligne_texte)) as statut_ligne,
    qt_commandee_texte as quantite_brute,
    try_to_number(qt_commandee_texte) as quantite_commandee,
    prix_vente_ht as prix_unitaire_vente_ht,
    remise_pct as taux_remise_pct
from {{ source('as400', 'lignes_commandes') }}