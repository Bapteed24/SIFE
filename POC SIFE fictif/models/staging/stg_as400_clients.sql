select
    cd_societe || '|' || cd_agence || '|' || cd_client as cle_client,
    cd_societe as code_societe,
    cd_agence as code_agence,
    cd_client as code_client,
    lb_client as nom_client,
    cd_segment as code_segment
from {{ source('as400', 'clients') }}