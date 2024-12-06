---
title: Național
---

```sql ro_diaspora
    SELECT * FROM (
    VALUES 
        (0, 'România'),
        (1, 'diaspora')
    ) AS t(id, label)
``` 
```sql mediu
    SELECT * FROM (
    VALUES 
        ('all', 'U+R'),
        ('U', 'urban'),
        ('R', 'rural')
        
    ) AS t(id, label)
``` 
```sql switch_var
    SELECT * FROM (
    VALUES 
        ('LT', 'Voturi exprimate'),
        ('prezenta', 'Prezență'),
        ('LP', 'Liste permanente'),
        ('LS', 'Liste suplimentare'),
        ('UM', 'Urnă mobilă')
    ) AS t(id, label)
``` 
```sql barchart_group_type
    SELECT * FROM (
    VALUES 
        ('stacked', 'stacked'),
        ('stacked100', 'stacked100'),
        ('grouped', 'grouped')
    ) AS t(id, label)
```  
```sql alegeri
    SELECT * FROM Alegeri
```
```sql PrezentaNational
    SELECT alegeri, diaspora, 
    strftime(CAST(substring(timestamp, 1, 19) AS TIMESTAMP), '%Y-%m-%d %H:%M:%S') AS timestamp,
    inscrisi_L_permanente,inscrisi_L_complementare,
    LP,LS,
    -- LSC,
    UM, LT, "M_1824", "M_2534","M_3544","M_4564","M_65+","F_1824","F_2534","F_3544","F_4564","F_65+" 
    FROM PrezentaNational WHERE 
    ('${inputs.ro_diaspora.value}' = 'all' OR diaspora = '${inputs.ro_diaspora.value}') AND alegeri = '${inputs.alegeriSingle.value}'      
    ORDER BY timestamp ASC

```
```sql PrezentaNationalOre
    SELECT alegeri, diaspora, 
    strftime(CAST(substring(timestamp, 1, 19) AS TIMESTAMP), '%Y-%m-%d %H:%M:%S') AS timestamp,
    inscrisi_L_permanente, 
    LT 
    FROM PrezentaNational WHERE 
    ('${inputs.ro_diaspora.value}' = 'all' OR diaspora = '${inputs.ro_diaspora.value}') AND alegeri = '${inputs.alegeriSingle.value}'      
    ORDER BY timestamp ASC
```
```sql voturiMF
    SELECT
        alegeri,
        diaspora,
        substr(timestamp, 1, 19) AS timestamp,
        'M' AS ctg,
        COALESCE("M_1824", 0) + COALESCE("M_2534", 0) + COALESCE("M_3544", 0) + COALESCE("M_4564", 0) + COALESCE("M_65+", 0) AS value
    FROM PrezentaNational
    WHERE  ('${inputs.ro_diaspora.value}' = 'all' OR diaspora = '${inputs.ro_diaspora.value}') AND alegeri = '${inputs.alegeriSingle.value}'     
    UNION ALL
    SELECT
        alegeri,
        diaspora,
        substr(timestamp, 1, 19) AS timestamp,
        'F' AS ctg,
        COALESCE("F_1824", 0) + COALESCE("F_2534", 0) + COALESCE("F_3544", 0) + COALESCE("F_4564", 0) + COALESCE("F_65+", 0) AS value
    FROM PrezentaNational
    WHERE  ('${inputs.ro_diaspora.value}' = 'all' OR diaspora = '${inputs.ro_diaspora.value}') AND alegeri = '${inputs.alegeriSingle.value}'      
    ORDER BY timestamp ASC, ctg;
```
```sql voturi_varsta_M
    SELECT
        alegeri,
        diaspora,
        substr(timestamp, 1, 19) AS timestamp,
        '1824' AS ctg,
        COALESCE("M_1824", 0)  AS value
    FROM PrezentaNational
    WHERE  ('${inputs.ro_diaspora.value}' = 'all' OR diaspora = '${inputs.ro_diaspora.value}') AND alegeri = '${inputs.alegeriSingle.value}'     
    UNION ALL
    SELECT
        alegeri,
        diaspora,
        substr(timestamp, 1, 19) AS timestamp,
        '2534' AS ctg,
        COALESCE("M_2534", 0)  AS value
    FROM PrezentaNational
    WHERE  ('${inputs.ro_diaspora.value}' = 'all' OR diaspora = '${inputs.ro_diaspora.value}') AND alegeri = '${inputs.alegeriSingle.value}'     
    UNION ALL
    SELECT
        alegeri,
        diaspora,
        substr(timestamp, 1, 19) AS timestamp,
        '3544' AS ctg,
        COALESCE("M_3544", 0)  AS value
    FROM PrezentaNational
    WHERE  ('${inputs.ro_diaspora.value}' = 'all' OR diaspora = '${inputs.ro_diaspora.value}') AND alegeri = '${inputs.alegeriSingle.value}'     
    UNION ALL
    SELECT
        alegeri,
        diaspora,
        substr(timestamp, 1, 19) AS timestamp,
        '4564' AS ctg,
        COALESCE("M_4564", 0)  AS value
    FROM PrezentaNational
    WHERE  ('${inputs.ro_diaspora.value}' = 'all' OR diaspora = '${inputs.ro_diaspora.value}') AND alegeri = '${inputs.alegeriSingle.value}'     
    UNION ALL
    SELECT
        alegeri,
        diaspora,
        substr(timestamp, 1, 19) AS timestamp,
        '65+' AS ctg,
        COALESCE("M_65+", 0)  AS value
    FROM PrezentaNational
    WHERE  ('${inputs.ro_diaspora.value}' = 'all' OR diaspora = '${inputs.ro_diaspora.value}') AND alegeri = '${inputs.alegeriSingle.value}'     
    ORDER BY timestamp ASC, ctg;
```
```sql voturi_varsta_F
    SELECT
        alegeri,
        diaspora,
        substr(timestamp, 1, 19) AS timestamp,
        '1824' AS ctg,
        COALESCE("F_1824", 0)  AS value
    FROM PrezentaNational
    WHERE  ('${inputs.ro_diaspora.value}' = 'all' OR diaspora = '${inputs.ro_diaspora.value}') AND alegeri = '${inputs.alegeriSingle.value}'     
    UNION ALL
    SELECT
        alegeri,
        diaspora,
        substr(timestamp, 1, 19) AS timestamp,
        '2534' AS ctg,
        COALESCE("F_2534", 0)  AS value
    FROM PrezentaNational
    WHERE  ('${inputs.ro_diaspora.value}' = 'all' OR diaspora = '${inputs.ro_diaspora.value}') AND alegeri = '${inputs.alegeriSingle.value}'     
    UNION ALL
    SELECT
        alegeri,
        diaspora,
        substr(timestamp, 1, 19) AS timestamp,
        '3544' AS ctg,
        COALESCE("F_3544", 0)  AS value
    FROM PrezentaNational
    WHERE  ('${inputs.ro_diaspora.value}' = 'all' OR diaspora = '${inputs.ro_diaspora.value}') AND alegeri = '${inputs.alegeriSingle.value}'     
    UNION ALL
    SELECT
        alegeri,
        diaspora,
        substr(timestamp, 1, 19) AS timestamp,
        '4564' AS ctg,
        COALESCE("F_4564", 0)  AS value
    FROM PrezentaNational
    WHERE  ('${inputs.ro_diaspora.value}' = 'all' OR diaspora = '${inputs.ro_diaspora.value}') AND alegeri = '${inputs.alegeriSingle.value}'     
    UNION ALL
    SELECT
        alegeri,
        diaspora,
        substr(timestamp, 1, 19) AS timestamp,
        '65+' AS ctg,
        COALESCE("F_65+", 0)  AS value
    FROM PrezentaNational
    WHERE  ('${inputs.ro_diaspora.value}' = 'all' OR diaspora = '${inputs.ro_diaspora.value}') AND alegeri = '${inputs.alegeriSingle.value}'     
    ORDER BY timestamp ASC, ctg;
```
```sql tip_liste
    SELECT
        alegeri,
        diaspora,
        substr(timestamp, 1, 19) AS timestamp,
        inscrisi_L_permanente,
        inscrisi_L_complementare,
        'LP' AS ctg,
        LP AS value
    FROM PrezentaNational
    WHERE  diaspora = '${inputs.ro_diaspora.value}' AND alegeri = '${inputs.alegeriSingle.value}' 
    UNION 
    SELECT
        alegeri,
        diaspora,
        substr(timestamp, 1, 19) AS timestamp,
        inscrisi_L_permanente,
        inscrisi_L_complementare,
        'LS' AS ctg,
        LS AS value
    FROM PrezentaNational
    WHERE  diaspora = '${inputs.ro_diaspora.value}' AND alegeri = '${inputs.alegeriSingle.value}' 
    UNION 
    SELECT
        alegeri,
        diaspora,
        substr(timestamp, 1, 19) AS timestamp,
        inscrisi_L_permanente,
        inscrisi_L_complementare,
        'UM' AS ctg,
        UM AS value
    FROM PrezentaNational
    WHERE  diaspora = '${inputs.ro_diaspora.value}' AND alegeri = '${inputs.alegeriSingle.value}' 
    ORDER BY timestamp ASC, ctg;

```
```sql voturi_totale

select sum(LT) as voturi from PrezentaNational
where alegeri = '${inputs.alegeriSingle.value}' and diaspora = '${inputs.ro_diaspora.value}'
```
```sql stats_prezenta_total
   SELECT 
    AVG(inscrisi_L_permanente) AS avg_inscrisi_L_permanente,
    SUM(LT) AS LT,
     SUM(LP) AS LP,
    SUM(LS) AS LS,
    SUM(UM) AS UM,
    SUM(LS)/SUM(LT) AS ratio_LS_LT,
    ROUND(1000 * SUM(LT) / AVG(inscrisi_L_permanente)) AS ratio
    FROM PrezentaNational
    WHERE alegeri = '${inputs.alegeriSingle.value}' and diaspora = '${inputs.ro_diaspora.value}'
    -- WHERE alegeri = '${inputs.alegeriSingle.value}' and diaspora = '0'
```
```sql stats_prezenta_judet_total
   SELECT 
    Judet,
    AVG(inscrisi_L_permanente) AS avg_inscrisi_L_permanente,
    SUM(LP) AS LP,
    SUM(LS) AS LS,
    SUM(UM) AS UM,
    SUM(LT) AS LT,
    ROUND(100 * SUM(LT) / AVG(inscrisi_L_permanente)) AS prezenta
    FROM PrezentaJudet
    WHERE alegeri = '${inputs.alegeriSingle.value}' and diaspora = '${inputs.ro_diaspora.value}'
    GROUP BY Judet
    -- WHERE alegeri = '${inputs.alegeriSingle.value}' and diaspora = '0'
```
```sql stats_prezenta
    SELECT 
        substr(timestamp, 1, 19) AS timestamp,
        substr(timestamp, 1, 16) AS timestampx,
        substr(timestamp, 12, 5) AS time,
        CAST(substring(timestamp, 1, 19) AS TIMESTAMP)  AS timestamp_date,
        LT, LS, LP, UM,
        LS/LT AS ratio_LS_LT,
        LT / inscrisi_L_permanente AS prezenta,
        (1 * LT / inscrisi_L_permanente 
            - LAG(1 * LT / inscrisi_L_permanente) OVER (ORDER BY timestamp)) AS growth
    FROM PrezentaNational
    WHERE alegeri = '${inputs.alegeriSingle.value}' and diaspora = '${inputs.ro_diaspora.value}'
    ORDER BY timestamp DESC
```
```sql prez_varsta
    SELECT
    '18-24' AS Grupe_varsta,
    SUM("M_1824" + "F_1824") AS Total
    FROM PrezentaNationalMediu
    WHERE alegeri = '${inputs.alegeriSingle.value}' and diaspora = '${inputs.ro_diaspora.value}'
    UNION ALL
    SELECT
        '25-34',
        SUM("M_2534" + "F_2534")
    FROM PrezentaNationalMediu
    WHERE alegeri = '${inputs.alegeriSingle.value}' and diaspora = '${inputs.ro_diaspora.value}'
    UNION ALL
    SELECT
        '35-44',
        SUM("M_3544" + "F_3544")
    FROM PrezentaNationalMediu
    WHERE alegeri = '${inputs.alegeriSingle.value}' and diaspora = '${inputs.ro_diaspora.value}'
    UNION ALL
    SELECT
        '45-64',
        SUM("M_4564" + "F_4564")
    FROM PrezentaNationalMediu
    WHERE alegeri = '${inputs.alegeriSingle.value}' and diaspora = '${inputs.ro_diaspora.value}'
    UNION ALL
    SELECT
        '65+',
        SUM("M_65+" + "F_65+")
    FROM PrezentaNationalMediu
    WHERE alegeri = '${inputs.alegeriSingle.value}' and diaspora = '${inputs.ro_diaspora.value}'
    ORDER BY Grupe_varsta

``` 
```sql prez_gen
    SELECT
        'Barbati' AS Gen,
        SUM("M_1824" + "M_2534" + "M_3544" + "M_4564" + "M_65+") AS Total
    FROM PrezentaNationalMediu
    WHERE alegeri = '${inputs.alegeriSingle.value}' and diaspora = '${inputs.ro_diaspora.value}'
    UNION ALL
    SELECT
        'Femei',
        SUM("F_1824" + "F_2534" + "F_3544" + "F_4564" + "F_65+")
    FROM PrezentaNationalMediu
    WHERE alegeri = '${inputs.alegeriSingle.value}' and diaspora = '${inputs.ro_diaspora.value}'
``` 
```sql prez_mediu
    SELECT
        CASE WHEN Mediu = 'U' THEN 'Urban' ELSE 'Rural' END AS Mediu,
        SUM("M_1824" + "M_2534" + "M_3544" + "M_4564" + "M_65+" + 
            "F_1824" + "F_2534" + "F_3544" + "F_4564" + "F_65+") AS Total
    FROM PrezentaNationalMediu
    WHERE alegeri = '${inputs.alegeriSingle.value}' and diaspora = '${inputs.ro_diaspora.value}'
    GROUP BY Mediu
``` 

```sql DimensionsGrid
    SELECT
        Mediu,  MF as Gen, Age AS Vârstă, diaspora, Judet, Total
    FROM 
        prezenta.PrezentaJudetTransposed 
    WHERE 
        alegeri = '${inputs.alegeriSingle.value}' 
        AND diaspora = '${inputs.ro_diaspora.value}'
    ORDER BY Judet
```
```sql DimensionsGridx
    SELECT
     substr(timestamp, 1, 19) AS timestamp,
    --  CAST(substring(timestamp, 1, 19) AS TIMESTAMP)  AS timestamp,
        Mediu,  MF as Gen, Age AS Vârstă, diaspora, Judet, Total
    FROM 
        prezenta.PrezentaJudetTransposed 
    WHERE 
        alegeri = '${inputs.alegeriSingle.value}' 
        AND diaspora = '${inputs.ro_diaspora.value}'
        AND ${inputs.DimensionsGrid}
    ORDER BY Judet
```
 
 
<div class="fixed top-12 z-20 bg-white">  
    <Dropdown
        data={alegeri} 
        name=alegeriSingle
        value=folder
        title='Alegeri'
        defaultValue={['2024-parl']}	
    />
    
    <Dropdown
        data={ro_diaspora}
        name=ro_diaspora
        value=id
        title='România/Diaspora'
        label=label
        defaultValue={[0]}	
    />
</div>
<!-- 
    <Dropdown
        data={mediu}
        name=mediu
        value=id
        title='Mediu'
        label=label
        defaultValue={['all']}	
    />
    <Slider
        title="Oră" 
        name=ore
        min=08.00
        max=21.00
        step=10.00
    /> 
    <Checkbox
        title="Relative" 
        name=relative_0 
    /> 
-->
<div class="grid grid-flow-row-dense lg:grid-cols-3">
   <div class="ps-2">
     
        <BigValue
            data={stats_prezenta_total[0]}
            value=LT
            title = "Voturi exprimate"
        />
        <BigValue 
            data={stats_prezenta_total[0]} 
            value=ratio
            title = "Prezență"
            fmt = pct0
        />      
        <BigValue 
            data={stats_prezenta} 
            value=prezenta
            comparison=growth
            sparkline=timestamp_date
            sparklineDateFmt = "YYYY-MM-DD hh:mm:ss"
            fmt = pct1
            comparisonFmt=pct1
            title = "Prezenta ultima oră"
        />
        <BigValue 
            data={stats_prezenta_total[0]} 
            value=LS
            title = "Liste suplimentare"
        />
        <BigValue 
            data={stats_prezenta_total[0]} 
            value=ratio_LS_LT
            title = "LS procent"
            fmt = pct0
        />  
        <BigValue 
            data={stats_prezenta_total[0]} 
            value=UM
            title = "Urnă mobilă"
        />
        <hr/>
        <BigValue
        data={prez_gen[0]}
        value=Total
        title = "Bărbați"
        />
        <BigValue
        data={prez_gen[1]}
        value=Total
        title = "Femei"
        />
        
        <BigValue
        data={prez_mediu[0]}
        value=Total
        title = "Rural"
        />
        <BigValue
        data={prez_mediu[1]}
        value=Total
        title = "Urban"
        />
        <BigValue data={prez_varsta[0]} value=Total title = "18-24" />
        <BigValue data={prez_varsta[1]} value=Total title = "25-24" />
        <BigValue data={prez_varsta[2]} value=Total title = "35-44" />
        <BigValue data={prez_varsta[3]} value=Total title = "45-64" />
        <BigValue data={prez_varsta[4]} value=Total title = "65+" />
        <BigValue 
        data={stats_prezenta[0]} 
        value=timestampx
        title = "Ultimele date"
        />
   </div>
   <div class="col-span-2">
  
        {#if inputs.ro_diaspora.value == '0'}
            <Dropdown
                data={switch_var} 
                name=tip_vizualizare
                value=id
                label=label
                title='Vizualizare'
                defaultValue={['LT']}	
            /> (WIP)
            
            <AreaMap 
                data={stats_prezenta_judet_total} 
                areaCol=Judet
                geoJsonUrl='/assets/gis/ro_judete_poligon-geo-.json'
                geoId=mnemonic
                value=LT
                startingZoom = 6
                link=Judet
                title = "Voturi pe județe"
                height=390
            />  
        {/if}
        {#if inputs.ro_diaspora.value == '1'}
            <AreaMap 
                data={stats_prezenta_judet_total} 
                areaCol=Judet
                geoJsonUrl='/assets/gis/ne_110m_admin_0_countries.geojson'
                geoId=iso_a2
                value=LT
                startingZoom = 5
                link=Judet
                title = "Prezenta diaspora"
                height=390
            />  
        {/if}

   </div>
</div>

<div class="grid grid-flow-row-dense lg:grid-cols-3 grid-flow-row-dense gap-10 ">
    <div>
        <BarChart data={prez_varsta}
            x = "Grupe_varsta"
            y = "Total"
            sort=False
            swapXY=true
            title="Voturi Grupe vârstă"
            />
            <BarChart data={prez_gen}
            x = "Gen"
            y = "Total"
            swapXY=true
            title="Voturi MFx"
            />
            <BarChart data={prez_mediu}
            x = "Mediu"
            y = "Total"
            swapXY=true
            title="Voturi Mediu"
            />
    </div>
    <div class="col-span-2">

        ## Cross vars

        Click to filter

        <div class="max-w-3xl"> 
            <DimensionGrid data={DimensionsGrid}  name="DimensionsGrid" metric='sum(Total)' />
        </div>

        <BarChart data={DimensionsGridx} x = "timestamp" y = "Total" sort=True />

        ## Top județe 
 
        <DataTable data={stats_prezenta_judet_total}  sort="LP desc" rows = 22 >
            <Column id=Judet/> 
            <Column id=LP title="L permanentă" contentType=bar /> 
            <Column id=LS title="L suplimenentare" contentType=colorscale /> 
            <Column id=UM title="Urnă mobilă" /> 
            <Column id=prezenta contentType=colorscale fmt=pct /> 
        </DataTable>
        
    </div>
</div>


<Dropdown
    data={barchart_group_type} 
    name=barchart_group_type
    value=id
    label=label
    title='View'
    defaultValue={['grouped']}	
/>

## Distribuție sexe

<BarChart data={voturiMF}
x = "timestamp"
y = "value"
series="ctg"
sort=True
title="Voturi MF"
type={inputs.barchart_group_type.value}
/>

<BarChart data={voturi_varsta_M}
x = "timestamp"
y = "value"
series="ctg"
sort=True
title="Voturi Bărbați vârstă"
type={inputs.barchart_group_type.value}
/>

<BarChart data={voturi_varsta_F}
x = "timestamp"
y = "value"
series="ctg"
sort=True
title="Voturi Femei vârstă"
type={inputs.barchart_group_type.value}
/>

## Tip liste

<BarChart data={tip_liste}
x = "timestamp"
y = "value"
series="ctg"
sort=True
title="Voturi Tip lista"
type={inputs.barchart_group_type.value} 
/>


<!-- <DimensionGrid data={DimensionsGrid2} /> -->




 

<!-- <BarChart data={PrezentaNational} x = "timestamp" y = "LT" sort=True /> -->

<!-- <DataTable data={MF}
rows = all
/>

<DataTable data={PrezentaNational} rows = all /> -->


 <style>
 #dtTopJud table tr td:nth-child(1) {
    background-color: #f3f4f6;
    width: 3em;
    max-width: 3em;
 }
 </style>
