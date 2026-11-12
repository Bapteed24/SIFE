select
    cle_ligne_commande,
    cle_commande,
    cle_client,
    code_societe,
    code_agence,
    code_region,
    code_article,
    date_facturation,
    quantite_commandee as quantite_facturee,
    montant_net_ht as montant_facture_ht
from {{ ref('int_lignes_commandes') }}
where statut_ligne = 'FAC'
  and motif_anomalie is null
  and date_facturation is not null