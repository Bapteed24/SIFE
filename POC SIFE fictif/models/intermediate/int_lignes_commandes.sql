with lignes_enrichies as (
    select
        commandes.cle_ligne_commande,
        commandes.cle_commande,
        commandes.cle_client,
        commandes.code_article,
        clients.code_societe,
        clients.code_agence,
        clients.code_region,
        commandes.date_facturation,
        commandes.statut_ligne,
        commandes.quantite_brute,
        commandes.quantite_commandee,
        commandes.prix_unitaire_vente_ht,
        commandes.taux_remise_pct,
        case
            when commandes.quantite_commandee is null
                or commandes.quantite_commandee <= 0 then 'QUANTITE_INVALIDE'
            when clients.cle_client is null then 'CLIENT_INTROUVABLE'
            when commandes.prix_unitaire_vente_ht is null
                or commandes.taux_remise_pct is null then 'PRIX_OU_REMISE_MANQUANT'
        end as motif_anomalie
    from {{ ref('stg_as400_lignes_commandes') }} as commandes
    left join {{ ref('int_clients_agences') }} as clients
        on commandes.cle_client = clients.cle_client
)

select
    *,
    case
        when motif_anomalie is null then round(
            quantite_commandee * prix_unitaire_vente_ht
            * (1 - taux_remise_pct / 100.0),
            2
        )
    end as montant_net_ht
from lignes_enrichies