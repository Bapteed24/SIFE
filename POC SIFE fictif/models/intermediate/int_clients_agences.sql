select
    clients.cle_client,
    clients.code_societe,
    clients.code_agence,
    clients.code_client,
    clients.nom_client,
    clients.code_segment,
    agences.cle_agence,
    agences.nom_agence,
    agences.code_region
from {{ ref('stg_as400_clients') }} as clients
left join {{ ref('stg_as400_agences') }} as agences
    on clients.code_societe = agences.code_societe
   and clients.code_agence = agences.code_agence