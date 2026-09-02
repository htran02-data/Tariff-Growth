# Tariff-Growth

Analysis of bilateral export flows and tariff effects using DuckDB.

## Contents
- `tariff_growth_pipeline.sql` — loads partner export data, unpivots
  annual columns to long format, and filters out aggregate regions.

## Data
Source CSV is not committed. Place `Partner_countries_all_exports.csv`
in a `data/` folder at the repo root before running.

## Running
```bash
duckdb < tariff_growth_pipeline.sql
```

## Requirements
DuckDB v1.5.5 or later.
