select
    cle_client,
    code_client,
    nom_client,
    code_societe,
    code_agence,
    nom_agence,
    code_region
from {{ ref('int_clients_agences') }}