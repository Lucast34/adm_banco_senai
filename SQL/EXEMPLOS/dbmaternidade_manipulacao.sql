SELECT 
    bebe.nome as 'Nome',
    bebe.dt_nascimento as 'Data de Nascimento',
    peso as 'Peso',
    altura as 'Altura',
    medico.nome as 'Médico',
    mae.nome as 'Mãe'
FROM
    bebe
        INNER JOIN
    mae ON bebe.id_mae = mae.id_mae
        INNER JOIN
    medico ON bebe.crm = medico.crm;