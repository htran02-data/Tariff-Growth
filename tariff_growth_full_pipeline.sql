CREATE TABLE raw AS
         SELECT * FROM read_csv('/Users/huongtran/Library/Mobile Documents/com~apple~CloudDocs/Tariff-Growth/Data/Partner_countries_all_exports.csv',header=true,encoding='UTF-8');
CREATE TABLE long AS
         SELECT COUNTRY, COUNTERPART_COUNTRY, CAST(year AS INT) AS year, value AS export_value_musd
         FROM raw
         UNPIVOT (value FOR year IN (
             "2000","2001","2002","2003","2004","2005","2006","2007","2008","2009",
             "2010","2011","2012","2013","2014","2015","2016","2017","2018","2019",
             "2020","2021","2022"
         ))
         WHERE value IS NOT NULL;




         WHERE COUNTRY NOT IN (
             'Advanced Economies','Africa','CIS',
             'EMDEs by Source of Export Earnings: Fuel',
             'EMDEs by Source of Export Earnings: Nonfuel',
             'Emerging Market and Developing Economies',
             'Emerging and Developing Asia','Emerging and Developing Europe',
             'Euro Area (EA)','Europe','European Union (EU)',
             'Latin America and the Caribbean (LAC)','Middle East',
             'Middle East and Central Asia',
             'Middle East, North Africa, Afghanistan, and Pakistan',
             'Sub-Saharan Africa (SSA)','World','Other Countries n.i.e.'
         )
         AND COUNTERPART_COUNTRY NOT IN (
             'Advanced Economies','Africa','CIS',
             'EMDEs by Source of Export Earnings: Fuel',
             'EMDEs by Source of Export Earnings: Nonfuel',
             'Emerging Market and Developing Economies',
             'Emerging and Developing Asia','Emerging and Developing Europe',
             'Euro Area (EA)','Europe','European Union (EU)',
             'Latin America and the Caribbean (LAC)','Middle East',
             'Middle East and Central Asia',
             'Middle East, North Africa, Afghanistan, and Pakistan',
             'Sub-Saharan Africa (SSA)','World','Other Countries n.i.e.'
         );
SELECT COUNTRY, SUM(export_value_musd) AS total_exports_musd
         FROM long_clean
         GROUP BY COUNTRY
         ORDER BY total_exports_musd DESC;
┌─────────────────────────────────────────────────────────┬────────────────────┐
│                         COUNTRY                         │ total_exports_musd │
│                         varchar                         │       double       │
├─────────────────────────────────────────────────────────┼────────────────────┤
│ China, People's Republic of                             │ 38802690.702572964 │
│ United States                                           │ 29763078.759614952 │
│ Germany                                                 │  28198813.92214599 │
│ Japan                                                   │ 15003126.676265005 │
│ Netherlands, The                                        │ 12710813.771003025 │
│ France                                                  │ 11549274.331099993 │
│ Italy                                                   │ 10340552.189553015 │
│ Korea, Republic of                                      │  9974424.386247009 │
│ United Kingdom                                          │  9657963.833816005 │
│ Hong Kong Special Administrative Region, People's Repu… │  9376067.014909985 │
│ Canada                                                  │  9144771.317057991 │
│ Belgium                                                 │  9069273.645288996 │
│ Russian Federation                                      │  7929760.429123017 │
│ Mexico                                                  │  7456253.986999992 │
│ Singapore                                               │  7260123.116298001 │
│ Saudi Arabia                                            │  6679181.599703002 │
│ Spain                                                   │  5887640.628256001 │
│ Switzerland                                             │  5326669.349875003 │
│ India                                                   │  5060554.831521001 │
│ Malaysia                                                │  4441349.515451997 │
│    ·                                                    │          ·         │
│    ·                                                    │          ·         │
│    ·                                                    │          ·         │
│ St. Vincent and the Grenadines                          │ 1566.4862740000003 │
│ Samoa                                                   │ 1518.8108759999993 │
│ Micronesia, Federated States of                         │ 1491.7158670000003 │
│ Naoero, Republic of                                     │ 1249.5508580000005 │
│ Grenada                                                 │ 1243.0878560000003 │
│ St. Kitts and Nevis                                     │        1050.604662 │
│ Gambia, The                                             │  940.7402899999997 │
│ American Samoa                                          │  923.1935249999995 │
│ Vanuatu                                                 │  847.5204340000004 │
│ Dominica                                                │  828.6997559999998 │
│ Curaçao, Kingdom of the Netherlands                     │           745.1406 │
│ Comoros, Union of the                                   │ 459.32715900000017 │
│ Anguilla, United Kingdom-British Overseas Territory     │  423.1333659999999 │
│ Tonga                                                   │ 300.58029300000004 │
│ São Tomé and Príncipe, Democratic Republic of           │         195.134692 │
│ Kiribati                                                │         185.687999 │
│ Palau, Republic of                                      │ 158.34791699999994 │
│ Montserrat, United Kingdom-British Overseas Territory   │ 127.47641499999997 │
│ Holy See                                                │ 120.68696700000004 │
│ Tuvalu                                                  │ 117.20736799999999 │
└─────────────────────────────────────────────────────────┴────────────────────┘
  206 rows (40 shown)        use .last to show entire result         2 columns
SELECT COUNTRY, year, SUM(export_value_musd) AS total_exports_musd
         FROM long_clean
         GROUP BY COUNTRY, year
         ORDER BY COUNTRY, year;
┌──────────────────────────────────┬───────┬────────────────────┐
│             COUNTRY              │ year  │ total_exports_musd │
│             varchar              │ int32 │       double       │
├──────────────────────────────────┼───────┼────────────────────┤
│ Afghanistan, Islamic Republic of │  2000 │         101.227232 │
│ Afghanistan, Islamic Republic of │  2001 │  91.75609800000001 │
│ Afghanistan, Islamic Republic of │  2002 │  93.47785599999999 │
│ Afghanistan, Islamic Republic of │  2003 │ 216.92741299999997 │
│ Afghanistan, Islamic Republic of │  2004 │ 135.88503100000003 │
│ Afghanistan, Islamic Republic of │  2005 │ 199.21097499999996 │
│ Afghanistan, Islamic Republic of │  2006 │         182.233858 │
│ Afghanistan, Islamic Republic of │  2007 │ 231.47345900000002 │
│ Afghanistan, Islamic Republic of │  2008 │  540.0655950000001 │
│ Afghanistan, Islamic Republic of │  2009 │ 403.44100400000013 │
│ Afghanistan, Islamic Republic of │  2010 │ 388.48365300000006 │
│ Afghanistan, Islamic Republic of │  2011 │ 375.85092999999995 │
│ Afghanistan, Islamic Republic of │  2012 │         305.795133 │
│ Afghanistan, Islamic Republic of │  2013 │         373.958199 │
│ Afghanistan, Islamic Republic of │  2014 │         414.759212 │
│ Afghanistan, Islamic Republic of │  2015 │         571.404973 │
│ Afghanistan, Islamic Republic of │  2016 │  596.4553350000002 │
│ Afghanistan, Islamic Republic of │  2017 │  831.8592500000001 │
│ Afghanistan, Islamic Republic of │  2018 │  875.1810360000001 │
│ Afghanistan, Islamic Republic of │  2019 │  863.8333210000001 │
│    ·                             │    ·  │          ·         │
│    ·                             │    ·  │          ·         │
│    ·                             │    ·  │          ·         │
│ Zimbabwe                         │  2003 │ 3341.8491169999998 │
│ Zimbabwe                         │  2004 │ 1794.0575909999993 │
│ Zimbabwe                         │  2005 │        1393.408785 │
│ Zimbabwe                         │  2006 │        1079.433957 │
│ Zimbabwe                         │  2007 │        2988.283998 │
│ Zimbabwe                         │  2008 │ 1336.4486830000005 │
│ Zimbabwe                         │  2009 │        1857.002943 │
│ Zimbabwe                         │  2010 │ 2723.4160090000005 │
│ Zimbabwe                         │  2011 │        3256.736792 │
│ Zimbabwe                         │  2012 │         4246.69227 │
│ Zimbabwe                         │  2013 │  4171.068820000001 │
│ Zimbabwe                         │  2014 │ 3969.7760779999994 │
│ Zimbabwe                         │  2015 │ 3509.0732169999997 │
│ Zimbabwe                         │  2016 │ 3429.4853279999993 │
│ Zimbabwe                         │  2017 │ 3041.4313900000006 │
│ Zimbabwe                         │  2018 │ 3539.6522940000004 │
│ Zimbabwe                         │  2019 │ 3649.1115140000006 │
│ Zimbabwe                         │  2020 │  4394.811676000001 │
│ Zimbabwe                         │  2021 │        6036.187288 │
│ Zimbabwe                         │  2022 │  6585.479323999999 │
└──────────────────────────────────┴───────┴────────────────────┘
  4684 rows (40 shown)                                3 columns
COPY (
             SELECT COUNTRY, year, SUM(export_value_musd) AS total_exports_musd
             FROM long_clean
             GROUP BY COUNTRY, year
             ORDER BY COUNTRY, year
         ) TO 'exports_by_country_year.csv' WITH (HEADER true);
COPY (
                      SELECT COUNTRY, year, SUM(export_value_musd) AS total_exports_musd
                      FROM long_clean
                      GROUP BY COUNTRY, year
                      ORDER BY COUNTRY, year
                  ) TO '/Users/huongtran/Library/Mobile Documents/com~apple~CloudDocs/Tariff-Growth/Data/exports_by_country_year.csv' WITH (HEADER true);
CREATE TABLE us_exports_raw AS 
         SELECT * FROM read_csv('/Users/huongtran/Library/Mobile Documents/com~apple~CloudDocs/Tariff-Growth/Data/Partner_countries_US_export.csv',header=true,encoding='UTF-8');
CREATE TABLE total_exports AS
         SELECT * FROM read_csv('/Users/huongtran/Library/Mobile Documents/com~apple~CloudDocs/Tariff-Growth/Data/exports_by_country_year.csv',header=true,encoding='UTF-8');
CREATE TABLE us_exports_long AS
         SELECT COUNTRY, year_str::INT AS year, value AS export_to_us_musd
         FROM us_exports_raw
         UNPIVOT (value FOR year_str IN (
             "2000","2001","2002","2003","2004","2005","2006","2007","2008","2009",
             "2010","2011","2012","2013","2014","2015","2016","2017","2018","2019",
             "2020","2021","2022"
         ))
         WHERE value IS NOT NULL;
CREATE TABLE exposure_share AS
         SELECT 
             b.COUNTRY,
             b.year,
             a.export_to_us_musd,
             b.total_exports_musd,
             a.export_to_us_musd / b.total_exports_musd AS exposure_share
         FROM us_exports_long a
         JOIN total_exports b 
             ON a.COUNTRY = b.COUNTRY AND a.year = b.year
         ORDER BY b.COUNTRY, b.year;
COPY exposure_share TO '/Users/huongtran/Library/Mobile Documents/com~apple~CloudDocs/Tariff-Growth/Data/growth_tariff.csv' WITH (HEADER true);
CREATE TABLE exposure_share_only AS
         SELECT COUNTRY, year, exposure_share
         FROM exposure_share;
COPY exposure_share_only TO '/Users/huongtran/Library/Mobile Documents/com~apple~CloudDocs/Tariff-Growth/Data/final_data.csv'WITH (HEADER true);
CREATE TABLE us_tariff_named AS
         SELECT COALESCE(cw.imf_name, ut."Partner Name") AS COUNTRY, ut.*
         FROM us_tariff_raw ut
         LEFT JOIN crosswalk cw ON ut."Partner Name" = cw.wits_name;
Catalog Error:
Table with name us_tariff_raw does not exist!
Did you mean "us_exports_raw"?

LINE 3: FROM us_tariff_raw ut
             ^
INSTALL excel;
LOAD excel;
CREATE TABLE us_tariff_raw AS 
         SELECT * FROM read_xlsx('/Users/huongtran/Library/Mobile Documents/com~apple~CloudDocs/Tariff-Growth/Data/WITS-US_Tariff_on_Partners.xlsx', sheet = 'Product-TimeSeries-Partner');
CREATE TABLE retal_tariff_raw AS 
         SELECT * FROM read_xlsx('/Users/huongtran/Library/Mobile Documents/com~apple~CloudDocs/Tariff-Growth/Data/WITS-Retaliatory_Tariff_on_US.xlsx', sheet = 'Product-TimeSeries-Product');
CREATE TABLE exposure AS 
         SELECT * FROM read_csv('/Users/huongtran/Library/Mobile Documents/com~apple~CloudDocs/Tariff-Growth/Data/final_data.csv', header=true);
CREATE TABLE crosswalk (wits_name VARCHAR, imf_name VARCHAR);





















ic of'),



s Republic of China'),






hina'),





         ('Micronesia, Fed. Sts.', 'Micronesia, Federated States of'),
         ('Moldova', 'Moldova, Republic of'),
         ('Montserrat', 'Montserrat, United Kingdom-British Overseas Territory'),
         ('Mozambique', 'Mozambique, Republic of'),
         ('Nauru', 'Naoero, Republic of'),
         ('Netherlands', 'Netherlands, The'),
         ('North Macedonia', 'North Macedonia, Republic of'),
         ('Occ.Pal.Terr', 'West Bank and Gaza'),
         ('Palau', 'Palau, Republic of'),
         ('Poland', 'Poland, Republic of'),
         ('Saint Maarten (Dutch part)', 'Sint Maarten, Kingdom of the Netherlands'),
         ('San Marino', 'San Marino, Republic of'),
         ('Sao Tome and Principe', 'São Tomé and Príncipe, Democratic Republic of'),
         ('Slovenia', 'Slovenia, Republic of'),
         ('South Sudan', 'South Sudan, Republic of'),
         ('Tajikistan', 'Tajikistan, Republic of'),
         ('Tanzania', 'Tanzania, United Republic of'),
         ('Turkey', 'Türkiye, Republic of'),
         ('Uzbekistan', 'Uzbekistan, Republic of'),
         ('Venezuela', 'Venezuela, República Bolivariana de'),
         ('Yemen', 'Yemen, Republic of');
CREATE TABLE us_tariff_named AS
         SELECT COALESCE(cw.imf_name, ut."Partner Name") AS COUNTRY, ut.*
         FROM us_tariff_raw ut
         LEFT JOIN crosswalk cw ON ut."Partner Name" = cw.wits_name;

CREATE TABLE retal_tariff_named AS
         SELECT COALESCE(cw.imf_name, rt."Reporter Name") AS COUNTRY, rt.*
         FROM retal_tariff_raw rt
         LEFT JOIN crosswalk cw ON rt."Reporter Name" = cw.wits_name;
CREATE TABLE us_tariff_long AS
         SELECT COUNTRY, year_str::INT AS year, value AS us_tariff_on_partner
         FROM us_tariff_named
         UNPIVOT (value FOR year_str IN (
             "2000","2001","2002","2003","2004","2005","2006","2007","2008","2009",
             "2010","2011","2012","2013","2014","2015","2016","2017","2018","2019",
             "2020","2021","2022"
         ))
         WHERE value IS NOT NULL;

CREATE TABLE retal_tariff_long AS
         SELECT COUNTRY, year_str::INT AS year, value AS partner_tariff_on_us
         FROM retal_tariff_named
         UNPIVOT (value FOR year_str IN (
             "2000","2001","2002","2003","2004","2005","2006","2007","2008","2009",
             "2010","2011","2012","2013","2014","2015","2016","2017","2018","2019",
             "2020","2021","2022"
         ))
         WHERE value IS NOT NULL;
CREATE TABLE combined_panel AS
         SELECT 
             e.COUNTRY,
             e.year,
             e.exposure_share,
             u.us_tariff_on_partner,
             r.partner_tariff_on_us
         FROM exposure e
         LEFT JOIN us_tariff_long u ON e.COUNTRY = u.COUNTRY AND e.year = u.year
         LEFT JOIN retal_tariff_long r ON e.COUNTRY = r.COUNTRY AND e.year = r.year
         ORDER BY e.COUNTRY, e.year;
COPY combined_panel TO 'final_data_2.csv' WITH (HEADER true);
COPY combined_panel TO '/Users/huongtran/Library/Mobile Documents/com~apple~CloudDocs/Tariff-Growth/Data/final_data_2.csv' WITH (HEADER true);
INSTALL excel; LOAD excel;

CREATE TABLE combined_panel AS 
         SELECT * FROM read_csv('/Users/huongtran/Library/Mobile Documents/com~apple~CloudDocs/Tariff-Growth/Data/final_data_2.csv',header=true);
Catalog Error:
Table with name "combined_panel" already exists!
CREATE TABLE DROP TABLE IF EXISTS combined_panel;
Parser Error:
syntax error at or near "TABLE"

LINE 1: CREATE TABLE DROP TABLE IF EXISTS combined_panel;
                          ^
DROP TABLE IF EXISTS combined_panel;
CREATE TABLE combined_panel AS 
         SELECT * FROM read_csv('/Users/huongtran/Library/Mobile Documents/com~apple~CloudDocs/Tariff-Growth/Data/final_data_2.csv',header=true);
CREATE TABLE gdp_raw AS 
         SELECT * FROM read_xlsx('/Users/huongtran/Library/Mobile Documents/com~apple~CloudDocs/Tariff-Growth/Data/WITS-Country-Timeseries.xlsx', sheet='Country-Timeseries');
CREATE TABLE crosswalk (wits_name VARCHAR, imf_name VARCHAR);
Catalog Error:
Table with name "crosswalk" already exists!




















ic of'),



s Republic of China'),






hina'),





         ('Micronesia, Fed. Sts.', 'Micronesia, Federated States of'),
         ('Moldova', 'Moldova, Republic of'),
         ('Montserrat', 'Montserrat, United Kingdom-British Overseas Territory'),
         ('Mozambique', 'Mozambique, Republic of'),
         ('Nauru', 'Naoero, Republic of'),
         ('Netherlands', 'Netherlands, The'),
         ('North Macedonia', 'North Macedonia, Republic of'),
         ('Occ.Pal.Terr', 'West Bank and Gaza'),
         ('Palau', 'Palau, Republic of'),
         ('Poland', 'Poland, Republic of'),
         ('Saint Maarten (Dutch part)', 'Sint Maarten, Kingdom of the Netherlands'),
         ('San Marino', 'San Marino, Republic of'),
         ('Sao Tome and Principe', 'São Tomé and Príncipe, Democratic Republic of'),
         ('Slovenia', 'Slovenia, Republic of'),
         ('South Sudan', 'South Sudan, Republic of'),
         ('Tajikistan', 'Tajikistan, Republic of'),
         ('Tanzania', 'Tanzania, United Republic of'),
         ('Turkey', 'Türkiye, Republic of'),
         ('Uzbekistan', 'Uzbekistan, Republic of'),
         ('Venezuela', 'Venezuela, República Bolivariana de'),
         ('Yemen', 'Yemen, Republic of');
CREATE TABLE gdp_named AS
         SELECT COALESCE(cw.imf_name, g."Country Name") AS COUNTRY, g.*
         FROM gdp_raw g
         LEFT JOIN crosswalk cw ON g."Country Name" = cw.wits_name;

CREATE TABLE gdp_long AS
         SELECT COUNTRY, year_str::INT AS year, value AS gdp_current_usd
         FROM gdp_named
         UNPIVOT (value FOR year_str IN (
             "2000","2001","2002","2003","2004","2005","2006","2007","2008","2009",
             "2010","2011","2012","2013","2014","2015","2016","2017","2018","2019",
             "2020","2021","2022"
         ))
         WHERE value IS NOT NULL;
CREATE TABLE us_gdp AS
         SELECT year, gdp_current_usd AS us_gdp_current_usd
         FROM gdp_long
         WHERE COUNTRY = 'United States';
CREATE TABLE final_panel AS
         SELECT 
             p.COUNTRY,
             p.year,
             p.exposure_share,
             p.us_tariff_on_partner,
             p.partner_tariff_on_us,
             g.gdp_current_usd AS partner_gdp_current_usd,
             ug.us_gdp_current_usd
         FROM combined_panel p
         LEFT JOIN gdp_long g ON p.COUNTRY = g.COUNTRY AND p.year = g.year
         LEFT JOIN us_gdp ug ON p.year = ug.year
         ORDER BY p.COUNTRY, p.year;
COPY final_panel TO '/Users/huongtran/Library/Mobile Documents/com~apple~CloudDocs/Tariff-Growth/Data/final_panel.csv' WITH (HEADER true);
