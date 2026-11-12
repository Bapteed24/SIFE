with jours as (
    select
        dateadd(
            day,
            row_number() over (order by seq4()) - 1,
            date '2020-01-01'
        ) as date_jour
    from table(generator(rowcount => 5844))
)

select
    date_jour,
    dateadd(day, 1 - dayofweekiso(date_jour), date_jour) as debut_semaine,
    date_trunc('month', date_jour) as debut_mois,
    year(date_jour) as annee
from jours