select
    cd_societe || '|' || cd_agence as cle_agence,
    cd_societe as code_societe,
    cd_agence as code_agence,
    lb_agence as nom_agence,
    cd_region as code_region
from {{ source('as400', 'agences') }}